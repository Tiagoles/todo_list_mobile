import 'dart:async';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/inspecao/api/anexo/inspecao_anexo_dto.dart';
import 'package:smaservicos/app/data/models/inspecao/api/conclusao/inspecao_conclusao_request.dart';
import 'package:smaservicos/app/data/models/motivo_retorno/motivo_retorno_dto.dart';
import 'package:smaservicos/app/data/services/inspecao/inspecao_client.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';

class InspecaoRemoteRepository{

  final InspecaoClient _client;

  InspecaoRemoteRepository(this._client);

  AsyncResult<List<Inspecao>> getAll(int? nrPda) async{
    if(nrPda == null){
      return Failure(AppValidationException('É necessário configurar o número do PDA para obter a lista de inspeções.'));
    }
    return _client.getAll(nrPda);
  }

  AsyncResult<Unit> setAsReceived(double nrInspecao) async{
    return _client.setAsReceived(nrInspecao);
  }

  AsyncResult<InspecaoConclusao> conclude(InspecaoConclusao inspecao) async {
    return _client.conclude(InspecaoConclusaoRequest.fromEntity(inspecao)).pure(inspecao);
  }

  AsyncResult<Unit> saveAttachment(int nrInspecao, List<Anexo> anexos) async {
    final files = (await Future.wait(
      anexos.map((a) => InspecaoAnexoDto.fromAnexo(a).getOrNull())
    )).whereType<InspecaoAnexoDto>().toList();

    if(files.isEmpty) return const Success(unit);

    return _client.saveAttachment(RegInspArquivoDTO(
      nrInspecao: nrInspecao,
      anexos: files,
    ));
  }

  AsyncResult<Unit> retornar(MotivoRetornoDTO dto) async {
    return _client.retornar(dto);
  }

}