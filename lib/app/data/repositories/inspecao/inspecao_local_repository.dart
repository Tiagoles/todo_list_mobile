import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/anexo/database/db_anexo.dart';
import 'package:smaservicos/app/data/models/inspecao/database/anexo/db_inspecao_anexo.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/db_inspecao.dart';
import 'package:smaservicos/app/data/services/inspecao/inspecao_database_service.dart';
import 'package:smaservicos/app/domain/entities/anexo/anexo.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao/inspecao.dart';
import 'package:smaservicos/app/domain/enums/inspecao/sync_status.dart';

class InspecaoLocalRepository {

  final InspecaoDatabaseService _dbService;

  InspecaoLocalRepository(this._dbService);

  AsyncResult<List<Inspecao>> getAll() async {
    return _dbService
      .getAll()
      .map((result) {
        return result.map((inspecao) => inspecao.toEntity()).toList();
      });
  }

  Stream<List<Inspecao>> watch(SyncStatus status, [bool includeRelationship = false]) {
    return _dbService.watchStatusQuery(status)
        .map((query) => query.find()
        .map((e) => e.toEntity(includeRelationship)).toList()
    );
  }

  AsyncResult<Inspecao> getById(int id, [bool includeRelationship = false]) {
    return _dbService.getById(id).map((inspecao) => inspecao.toEntity(includeRelationship));
  }

  AsyncResult<Inspecao> getByNrInspecao(int nrInspecao) {
    return _dbService.getByNrInspecao(nrInspecao).map((inspecao) => inspecao.toEntity());
  }

  AsyncResult<Inspecao> save(Inspecao inspecao) {
    return _dbService.save(DbInspecao.fromEntity(inspecao))
      .map((db) => db.toEntity());
  }

  AsyncResult<InspecaoConclusao> saveConclusao(InspecaoConclusao conclusao) async {
    return _dbService
        .saveConclusao(DbInspecaoConclusao.fromEntity(conclusao), conclusao.inspecao!.nrInspecao.toInt())
        .map((dbConclusao) => dbConclusao.toEntity());
  }

  AsyncResult<Unit> remove(int id) async {
    return _dbService.getById(id)
      .flatMap((_) => _dbService.remove(id))
      .pure(unit);
  }

  AsyncResult<Unit> removeLogically(int id) async {
    return _dbService.removeLogically(id);
  }

  AsyncResult<Unit> removerConclusaoByInspecaoId(int id) async {
    return _dbService.removerConclusaoByInspecaoId(id).pure(unit);
  }

  AsyncResult<InspecaoConclusao> getConclusaoCompletaByIdInspecao(int id) async {
    return _dbService.getById(id).map((inspecao){
      final dbConclusao = inspecao.conclusao.target!;
      return dbConclusao.toEntity().copyWith(
        acoesTomadas: dbConclusao.acoesTomadas.map((acao) => acao.toEntity()).toList(),
        itensInspecionados: dbConclusao.itensInspecionados.map((item) => item.toEntity()).toList(),
        irregularidades: dbConclusao.irregularidades.map((irregularidade) => irregularidade.toEntity()).toList(),
      );
    });
  }

  AsyncResult<Unit> removerAnexosByConclusaoId(int conclusaoId) async {
    return _dbService.removerAnexosByConclusaoId(conclusaoId);
  }

  AsyncResult<Unit> removerAnexosByInspecaoId(int id) async {
    return _dbService.removerAnexosByInspecaoId(id);
  }

  AsyncResult<List<Anexo>> saveAnexos(InspecaoConclusao conclusao, List<Anexo> anexos) async {
    final dbAnexos = anexos
      .map((anexo) => DbInspecaoAnexo.link(
        inspecao: DbInspecaoConclusao.fromEntity(conclusao),
        anexo: DbAnexo.fromEntity(anexo)
      )).toList();
    return _dbService.saveAnexos(dbAnexos).pure(anexos);
  }

  AsyncResult<List<Anexo>> getAnexosFromConclusao(int conclusaoId) async {
    return _dbService.getAnexosByConclusaoId(conclusaoId)
      .map((anexos) => anexos.map((anexo) => anexo.anexo.target).toList())
      .map((dbAnexos) => dbAnexos.whereType<DbAnexo>().map((dbAnexo) => dbAnexo.toEntity()).toList());
  }

  AsyncResult<List<Anexo>> getAnexosFromInspecao(int conclusaoId) async {
    return _dbService.getAnexosFromInspecao(conclusaoId)
        .map((anexos) => anexos.map((anexo) => anexo.anexo.target).toList())
        .map((dbAnexos) => dbAnexos.whereType<DbAnexo>().map((dbAnexo) => dbAnexo.toEntity()).toList());
  }

}
