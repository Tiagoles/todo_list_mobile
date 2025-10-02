import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/acao_tomada/acao_tomada_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/data/repositories/inspecao_item/inspecao_item_repository.dart';
import 'package:smaservicos/app/data/repositories/tipo_irregularidade/tipo_irregularidade_repository.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';

class SalvarInspecaoConclusaoLocal{

  final InspecaoLocalRepository _inspecaoLocalRepository;
  final AcaoTomadaRepository _acaoTomadaRepository;
  final InspecaoItemRepository _inspecaoItemRepository;
  final TipoIrregularidadeRepository _tipoIrregularidadeRepository;

  SalvarInspecaoConclusaoLocal(
    this._inspecaoLocalRepository,
    this._acaoTomadaRepository,
    this._inspecaoItemRepository,
    this._tipoIrregularidadeRepository,
  );

  AsyncResult<InspecaoConclusao> call(InspecaoConclusao conclusao) async {
    if(conclusao.inspecao == null){
      return Failure(AppValidationException('Inspeção não associada à conclusão.'));
    }
    return _inspecaoLocalRepository.saveConclusao(conclusao)
      .flatMap((conclusaoSalva) => _acaoTomadaRepository.saveConclusao(conclusao.acoesTomadas, conclusaoSalva)
        .map((_) => conclusaoSalva))
      .flatMap((conclusaoSalva) => _inspecaoItemRepository.saveConclusao(conclusao.itensInspecionados, conclusaoSalva)
        .map((_) => conclusaoSalva))
      .flatMap((conclusaoSalva) => _tipoIrregularidadeRepository.saveConclusao(conclusao.irregularidades, conclusaoSalva)
        .map((_) => conclusaoSalva));
  }

}