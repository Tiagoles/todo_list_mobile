import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/anexo/database/db_anexo.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';

class AnexoService{

  final DatabaseService _dbService;

  AnexoService(this._dbService);

  AsyncResult<List<DbAnexo>> getAll() async {
    return _dbService.getAll<DbAnexo>();
  }

  AsyncResult<List<DbAnexo?>> getMany(List<int> ids) async {
    if(ids.isEmpty) return const Success([]);
    return _dbService.getMany<DbAnexo>(ids);
  }

  AsyncResult<List<DbAnexo>> putAndGetMany(List<DbAnexo> anexos) async {
    if(anexos.isEmpty) return const Success([]);
    return _dbService.putAndGetMany<DbAnexo>(anexos);
  }

  AsyncResult<Unit> removeMany(List<int> ids) async {
    return _dbService.removeMany<DbAnexo>(ids);
  }

}