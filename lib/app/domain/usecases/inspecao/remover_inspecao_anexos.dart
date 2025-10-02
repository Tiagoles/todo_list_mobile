import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/domain/usecases/anexo/remover_anexos.dart';

class RemoverInspecaoAnexos{

  final InspecaoLocalRepository _localRepository;
  final RemoverAnexos _removerAnexos;

  RemoverInspecaoAnexos(this._localRepository, this._removerAnexos);

  AsyncResult<Unit> call(int idInspecao){
    return _localRepository.getAnexosFromInspecao(idInspecao)
      .flatMap((anexos) => _removerAnexos(anexos))
      .flatMap((_) => _localRepository.removerAnexosByInspecaoId(idInspecao));
  }

}