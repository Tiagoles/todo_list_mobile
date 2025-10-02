import 'dart:io';

import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/repositories/anexo/anexo_repository.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';

class RemoverAnexos{

  final AnexoRepository _anexoRepository;

  RemoverAnexos(this._anexoRepository);

  AsyncResult<Unit> call(List<Anexo> anexos) async {
    if(anexos.isEmpty) return const Success(unit);
    final ids = anexos.where((e) => e.id != null).map((e) => e.id!).toList();
    if(ids.isEmpty) return const Success(unit);
    for(final anexo in anexos){
      final f = File(anexo.path);
      if (await f.exists()) {
        try { await f.delete(); } catch (_) {}
      }
    }
    return _anexoRepository.removeMany(ids);
  }

}