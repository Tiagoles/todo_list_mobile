import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_remote_repository.dart';

class ConcluirInspecaoApi{

  final InspecaoLocalRepository _localRepository;
  final InspecaoRemoteRepository _remoteRepository;

  ConcluirInspecaoApi(this._localRepository, this._remoteRepository);

  /// Conclui a inspeção com [id] enviando os dados para a API remota.
  AsyncResult<Unit> call(int id) async {
    return _localRepository.getConclusaoCompletaByIdInspecao(id)
      .flatMap((conclusao) => _remoteRepository.conclude(conclusao))
      .flatMap((conclusao) => _localRepository.getAnexosFromConclusao(conclusao.id!)
        .flatMap((anexos) => _remoteRepository.saveAttachment(conclusao.inspecao!.nrInspecao.toInt(), anexos)))
      .flatMap((conclusao) => _localRepository.removeLogically(id));
  }

}