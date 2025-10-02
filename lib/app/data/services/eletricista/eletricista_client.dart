import 'dart:isolate';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/eletricista/eletricista_lov/eletricista_lov.dart';
import 'package:smaservicos/app/domain/models/eletricista/login_result/eletricista_login_result.dart';

class EletricistaClient {
  final String url = 'eletricistas/';
  final ClientHttp _client;

  EletricistaClient(this._client);

  AsyncResult<EletricistaLoginResult> login(
    Credentials credentials,
  ) async {
    final result = await _client.post('${url}login', credentials.toEletricistaJson());
    return result.map((resp) => EletricistaLoginResult.fromJson(resp.data));
  }

  AsyncResult<List<EletricistaLov>> findLov(
    String? filter,
  ) async {
    final result = await _client.get(
      url,
      queryParameters: {'dsEletricista': filter},
    );
    return Isolate.run(
      () => result.map(
        (resp) =>
            (resp.data as List).map((e) => EletricistaLov.fromJson(e)).toList(),
      ),
    );
  }
}
