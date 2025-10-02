import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/inspecao/database/anexo/db_inspecao_anexo.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/db_inspecao.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';

class InspecaoDatabaseService{

  final DatabaseService _databaseService;
  InspecaoDatabaseService(this._databaseService);

  AsyncResult<List<DbInspecao>> getAll() async {
    return await _databaseService.query<DbInspecao>(DbInspecao_.deletedAt.isNull())
      .map((query) => query.findAsync());
  }

  Stream<Query<DbInspecao>> watchStatusQuery(SyncStatus status, [bool triggerImmediately = true]) {
    return _databaseService.watchQuery<DbInspecao>(conditions: DbInspecao_.status.equals(status.code)
      .and(DbInspecao_.deletedAt.isNull()), triggerImmediately: triggerImmediately);
  }

  AsyncResult<DbInspecao> getById(int id) async {
    return await _databaseService.query<DbInspecao>(DbInspecao_.id.equals(id).and(DbInspecao_.deletedAt.isNull()))
      .flatMap((query) async {
        final result = await query.findFirstAsync();
        if (result == null) {
          return Failure(LocalDatabaseException('Inspeção não encontrada.'));
        }
        return Success(result);
      });
  }

  AsyncResult<DbInspecao> getByNrInspecao(int nrInspecao) async {
    return await _databaseService.query<DbInspecao>(DbInspecao_.nrInspecao.equals(nrInspecao)
      .and(DbInspecao_.deletedAt.isNull()))
      .flatMap((query) async {
        final result = await query.findFirstAsync();
        if (result == null) {
          return Failure(LocalDatabaseException('Inspeção com número $nrInspecao não encontrada.'));
        }
        return Success(result);
      });
  }

  AsyncResult<DbInspecao> save(DbInspecao inspecao) async {
    return await _databaseService.put<DbInspecao>(inspecao);
  }

  AsyncResult<DbInspecaoConclusao> saveConclusao(DbInspecaoConclusao conclusao, int nrInspecao) async {
    return getByNrInspecao(nrInspecao).flatMap((dbInspecao){
      conclusao.inspecao.target = dbInspecao;
      return _databaseService.put<DbInspecaoConclusao>(conclusao).flatMap((dbConclusao) {
        dbInspecao.conclusao.target = dbConclusao;
        return _databaseService.put<DbInspecao>(dbInspecao).pure(dbConclusao);
      });
    });
  }


  AsyncResult<bool> remove(int id) async {
    return await _databaseService.remove<DbInspecao>(id);
  }

  AsyncResult<Unit> removeLogically(int id) async {
    return getById(id).flatMap((inspecao) {
      inspecao.deletedAt = DateTime.now();
      return save(inspecao).pure(unit);
    });
  }

  AsyncResult<bool> removerConclusao(int id) async {
    return await _databaseService.remove<DbInspecaoConclusao>(id);
  }

  AsyncResult<List<int>> saveAnexos(List<DbInspecaoAnexo> anexos) async {
    if(anexos.isEmpty) return const Success([]);
    return _databaseService.putMany<DbInspecaoAnexo>(anexos);
  }

  AsyncResult<List<DbInspecaoAnexo>> getAnexosByConclusaoId(int conclusaoId) async {
    return _databaseService.query<DbInspecaoAnexo>(DbInspecaoAnexo_.inspecao.equals(conclusaoId))
      .map((query) => query.findAsync());
  }

  AsyncResult<List<DbInspecaoAnexo>> getAnexosFromInspecao(int idInspecao) async {
    return getById(idInspecao)
      .flatMap((inspecao) async {
        final conclusao = inspecao.conclusao.target;
        if(conclusao == null) {
          return Failure(LocalDatabaseException('Inspeção não possui conclusão ou a conclusão não possui ID.'));
        }
        return getAnexosByConclusaoId(conclusao.id);
      });
  }

  AsyncResult<Unit> removerAnexosByConclusaoId(int conclusaoId) async {
    return getAnexosByConclusaoId(conclusaoId)
      .flatMap((dbAnexos) => _databaseService.removeMany<DbInspecaoAnexo>(dbAnexos.map((e) => e.id).toList()))
      .pure(unit);
  }

  AsyncResult<Unit> removerAnexosByInspecaoId(int id) async {
    return getById(id)
      .flatMap((inspecao) async => removerAnexosByConclusaoId(inspecao.conclusao.targetId));
  }

  AsyncResult<Unit> removerConclusaoByInspecaoId(int id) async {
    return getById(id)
      .flatMap((inspecao) async => removerConclusao(inspecao.conclusao.targetId)).pure(unit);
  }

}