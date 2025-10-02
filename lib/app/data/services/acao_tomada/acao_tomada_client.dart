import 'dart:isolate';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/get/acao_tomada_api_result.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';

const _url = 'acao-tomada-irregularidade';

class AcaoTomadaClient{

  final ClientHttp _client;

  AcaoTomadaClient(this._client);

  AsyncResult<List<AcaoTomadaApiResult>> getAll() async {
    final result = await _client.get(_url);
    return Isolate.run(() =>
      result.map((r) => (r.data as List).map(
        (item) => AcaoTomadaApiResult.fromJson(item)
      ).toList()
    ));
  }

}