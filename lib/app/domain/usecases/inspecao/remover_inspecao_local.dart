import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';
import 'package:smaservicos/app/domain/usecases/inspecao/remover_inspecao_anexos.dart';

class RemoverInspecaoLocal{

  final InspecaoLocalRepository _inspecaoLocalRepository;
  final AcaoTomadaRepository _acaoTomadaRepository;
  final InspecaoItemRepository _inspecaoItemRepository;
  final TipoIrregularidadeRepository _tipoIrregularidadeRepository;
  final RemoverInspecaoAnexos _removerInspecaoAnexo;

  RemoverInspecaoLocal(
    this._inspecaoLocalRepository,
    this._acaoTomadaRepository,
    this._inspecaoItemRepository,
    this._tipoIrregularidadeRepository,
    this._removerInspecaoAnexo,
  );

  AsyncResult<Unit> call(int id) async {
    return _acaoTomadaRepository.resetConclusao(id)
      .flatMap((_) => _inspecaoItemRepository.resetConclusao(id))
      .flatMap((_) => _tipoIrregularidadeRepository.resetConclusao(id))
      .flatMap((_) => _removerInspecaoAnexo(id))
      .flatMap((_) => _inspecaoLocalRepository.removerConclusaoByInspecaoId(id))
      .flatMap((_) => _inspecaoLocalRepository.remove(id));
  }

}