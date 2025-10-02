import 'dart:io';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/inspecao/inspecao_local_repository.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/exceptions/app_validation_exception.dart';
import 'package:smaservicos/app/domain/usecases/anexo/remover_anexos.dart';
import 'package:smaservicos/app/domain/usecases/anexo/salvar_anexos.dart';

class SalvarInspecaoAnexos{

  final InspecaoLocalRepository _inspecaoLocalRepository;
  final SalvarAnexos _salvarAnexos;
  final RemoverAnexos _removerAnexos;

  SalvarInspecaoAnexos(
    this._inspecaoLocalRepository,
    this._salvarAnexos,
    this._removerAnexos,
  );

  AsyncResult<List<Anexo>> call(InspecaoConclusao conclusao, List<File> files) async {
    if(conclusao.id == null) {
      return Failure(AppValidationException('Conclusão não possui ID. Salve a conclusão antes de adicionar anexos.'));
    }
    return _salvarAnexos(files.take(5).toList())
      .flatMap((toSave) async {
        return _inspecaoLocalRepository.getAnexosFromConclusao(conclusao.id!)
          .flatMap(_removerAnexos.call)
          .flatMap((_) => _inspecaoLocalRepository.removerAnexosByConclusaoId(conclusao.id!))
          .pure(toSave);
      }).flatMap((anexos) => _inspecaoLocalRepository.saveAnexos(conclusao, anexos));
  }

}