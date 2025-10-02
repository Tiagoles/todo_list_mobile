import 'dart:isolate';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/inspecao_item/api/get/inspecao_item_api_result.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';

const _url = 'inspecao-item';

class InspecaoItemClient{

  final ClientHttp _client;

  InspecaoItemClient(this._client);

  AsyncResult<List<InspecaoItemApiResult>> getAll() async {
    final result = await _client.get(_url);
    return Isolate.run(() =>
      result.map((r) => (r.data as List).map(
        (item) => InspecaoItemApiResult.fromJson(item)
      ).toList()
    ));
  }

}