import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/apontamento_hora/database/db_apontamento_hora.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';

class ApontamentoHoraDatabaseService {

  final DatabaseService _databaseService;

  ApontamentoHoraDatabaseService(this._databaseService);

  AsyncResult<DbApontamentoHora> save(DbApontamentoHora dbModel) async {
    return _databaseService.put<DbApontamentoHora>(dbModel);
  }

  AsyncResult<List<DbApontamentoHora>> getAll() async {
    return _databaseService.getAll<DbApontamentoHora>();
  }

  AsyncResult<DbApontamentoHora> getById(int id) async {
    return _databaseService.getById<DbApontamentoHora>(id);
  }

  AsyncResult<bool> remove(int id) async {
    return _databaseService.remove<DbApontamentoHora>(id);
  }

}