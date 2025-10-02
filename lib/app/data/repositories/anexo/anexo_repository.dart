import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/anexo/database/db_anexo.dart';
import 'package:smaservicos/app/data/services/anexo/anexo_service.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';

class AnexoRepository {

  final AnexoService _service;

  AnexoRepository(this._service);

  AsyncResult<List<Anexo>> getAll() async {
    return _service.getAll().map((result) {
      return result.map((anexo) => anexo.toEntity()).toList();
    });
  }

  AsyncResult<List<Anexo>> getMany(List<int> ids) async {
    if (ids.isEmpty) return const Success([]);
    return _service.getMany(ids)
      .map((result) => result.map((anexo) => anexo?.toEntity()).whereType<Anexo>().toList());
  }

  AsyncResult<List<Anexo>> putAndGetMany(List<Anexo> anexos) async {
    if (anexos.isEmpty) return const Success([]);
    return _service.putAndGetMany(anexos.map((anexo) => DbAnexo.fromEntity(anexo)).toList())
      .map((result) => result.map((anexo) => anexo.toEntity()).toList());
  }

  AsyncResult<Unit> removeMany(List<int> ids) async {
    return _service.removeMany(ids);
  }

}