import 'dart:isolate';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/inspecao/api/anexo/inspecao_anexo_dto.dart';
import 'package:smaservicos/app/data/models/inspecao/api/conclusao/inspecao_conclusao_request.dart';
import 'package:smaservicos/app/data/models/inspecao/api/get/inspecao_get_result.dart';
import 'package:smaservicos/app/data/models/motivo_retorno/motivo_retorno_dto.dart';
import 'package:smaservicos/app/data/services/core/clients/client_http.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/utils/formatters/asp_net_form_data.dart';

const _url = 'registro-inspecao';

class InspecaoClient {
  final ClientHttp _client;
  InspecaoClient(this._client);

  AsyncResult<List<Inspecao>> getAll(int nrPda) async {
    final result = await _client.get(_url, queryParameters: {'nrPda': nrPda});
    return Isolate.run(
      () => result.map((resp) {
        return (resp.data as List).map((e) => InspecaoGetResult.fromJson(e).toEntity()).toList();
      }),
    );
  }

  AsyncResult<Inspecao> getById(int id) async {
    final result = await _client.get('$_url/$id');
    return Isolate.run(() => result.map((resp) => Inspecao.fromJson(resp.data)));
  }

  AsyncResult<Inspecao> post(Inspecao inspecao) async {
    final result = await _client.post(_url, inspecao.toJson());
    return Isolate.run(() => result.map((resp) => Inspecao.fromJson(resp.data)));
  }

  AsyncResult<Unit> setAsReceived(double nrInspecao) async {
    final response = await _client.put('$_url/recebido-pda/${nrInspecao.toInt()}', null);
    return response.pure(unit);
  }

  AsyncResult<Unit> conclude(InspecaoConclusaoRequest body) async {
    final json = await Isolate.run(() => body.toJson());
    return _client.post('$_url/concluir', json).pure(unit);
  }

  AsyncResult<Unit> retornar(MotivoRetornoDTO dto) async {
    final response = await _client.put('$_url/devolvido-pda', dto.toJson());
    return response.pure(unit);
  }

  AsyncResult<Unit> saveAttachment(RegInspArquivoDTO dto) async {
    final response = await _client.post(
        '$_url/reg-fotos',
        AspNetFormData.fromMap(dto.toJson())
    );
    return response.pure(unit);
  }
}
