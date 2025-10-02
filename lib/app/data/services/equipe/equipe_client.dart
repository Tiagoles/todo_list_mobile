import 'dart:isolate';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/domain/models/auth/credentials/credentials.dart';
import 'package:smaservicos/app/domain/models/equipe/equipe_lov/equipe_lov.dart';
import 'package:smaservicos/app/domain/models/equipe/login_result/equipe_login_result.dart';

class EquipeClient {
  final String url = 'equipes/';
  final ClientHttp _client;

  EquipeClient(this._client);

  AsyncResult<EquipeLoginResult> login(Credentials credentials) async {
    final result = await _client.post('$url/login', credentials.toEquipeJson());
    return result.map((resp) => EquipeLoginResult.fromJson(resp.data));
  }

  AsyncResult<List<EquipeLov>> findLov(String? filter) async {
    final result = await _client.get(
      url,
      queryParameters: {'dsEletricista': filter},
    );
    return Isolate.run(
          () => result.map(
            (resp) =>
            (resp.data as List).map((e) => EquipeLov.fromJson(e)).toList(),
      ),
    );
  }

}