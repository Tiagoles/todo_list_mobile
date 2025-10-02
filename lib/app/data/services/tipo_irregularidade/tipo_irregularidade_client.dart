import 'dart:isolate';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/api/get/tipo_irregularidade_api_result.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';

const _url = 'tipo-irregular-inspecao';

class TipoIrregularidadeClient{

  final ClientHttp _client;

  TipoIrregularidadeClient(this._client);

  AsyncResult<List<TipoIrregularidadeApiResult>> getAll() async {
    final result = await _client.get(_url);
    return Isolate.run(() =>
      result.map((r) => (r.data as List).map(
        (item) => TipoIrregularidadeApiResult.fromJson(item)
      ).toList()
    ));
  }

}