import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/motivo_retorno/motivo_retorno_dto.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_remote_repository.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/tipo_ocorrencia/tipo_ocorrencia.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';

class RetornarInspecaoApi{

  final InspecaoLocalRepository _localRepository;
  final InspecaoRemoteRepository _remoteRepository;
  final ConnectivityService _connectivityService;

  RetornarInspecaoApi(this._localRepository, this._remoteRepository, this._connectivityService);

  AsyncResult<Unit> call(Inspecao inspecao) async {
    return _connectivityService.isConnected().flatMap((isConnected) async {
      if(!isConnected) return Failure(AppSocketException());
      if(inspecao.cdTipoOcorrencia == null) {
        return Failure(AppValidationException('O tipo de ocorrência é obrigatório para retornar a inspeção.'));
      }
      if(inspecao.id == null) {
        return Failure(AppValidationException('A inspeção deve estar salva localmente para ser retornada.'));
      }
      if(inspecao.cdTipoOcorrencia == TipoOcorrencia.outros.code && inspecao.dsComplementarOcorrencia == null){
        return Failure(AppValidationException('A descrição da ocorrência é obrigatória quando o tipo de ocorrência for "Outros". Por favor digite uma observação'));
      }
      return _remoteRepository.retornar(MotivoRetornoDTO(
          nrInspecao: inspecao.nrInspecao.toInt(),
          cdTipoOcorrencia: inspecao.cdTipoOcorrencia!,
          dsObservacao: inspecao.dsComplementarOcorrencia,
        )).flatMap((_) => _localRepository.removeLogically(inspecao.id!));
    });
  }

}