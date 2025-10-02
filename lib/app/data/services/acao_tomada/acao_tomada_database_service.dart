import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/conclusao/acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada.dart';
import 'package:smaservicos/app/data/models/acao_tomada/database/db_acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';

class AcaoTomadaDatabaseService {
  final DatabaseService _databaseService;

  AcaoTomadaDatabaseService(this._databaseService);

  AsyncResult<List<AcaoTomada>> saveAll(List<AcaoTomada> items) async {
    final tasks = items.map((item) async {
      final id = (await getByCd(item.cdAcaoTomada)).getOrNull()?.id;
      return DbAcaoTomada.fromEntity(item, id: id ?? 0);
    });

    final itemsToSave = await Future.wait(tasks);
    return _databaseService.putMany<DbAcaoTomada>(itemsToSave).pure(items);
  }

  AsyncResult<AcaoTomada> save(AcaoTomada item) async {
    final id = (await getByCd(item.cdAcaoTomada)).getOrNull()?.id;
    return _databaseService.put<DbAcaoTomada>(DbAcaoTomada.fromEntity(item, id: id ?? 0)).pure(item);
  }

  AsyncResult<List<AcaoTomada>> getAll() async {
    return await _databaseService.getAll<DbAcaoTomada>()
      .map((items) => items.map((e) => e.toEntity()).toList());
  }

  AsyncResult<Unit> reset() async {
    return _databaseService.reset<DbAcaoTomada>();
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _databaseService.query<DbAcaoTomadaConclusao>(DbAcaoTomadaConclusao_.inspecao.equals(idInspecao))
        .map((query){
      query.remove();
      return unit;
    });
  }

  AsyncResult<List<DbAcaoTomada>> getManyByCds(List<int> cds) async {
    return _databaseService.query<DbAcaoTomada>(DbAcaoTomada_.cdAcaoTomada.oneOf(cds))
        .map((query) => query.findAsync());
  }

  AsyncResult<DbAcaoTomada> getByCd(int cdItemInspecionado) async {
    return await _databaseService.query<DbAcaoTomada>(DbAcaoTomada_.cdAcaoTomada.equals(cdItemInspecionado))
        .flatMap((query) async {
      final result = await query.findFirstAsync();
      if (result == null) {
        return Failure(LocalDatabaseException('Inspeção com número $cdItemInspecionado não encontrada.'));
      }
      return Success(result);
    });
  }

  AsyncResult<List<DbAcaoTomadaConclusao>> saveConclusao(List<AcaoTomadaConclusao> acoes, DbInspecaoConclusao inspecao){
    return resetConclusao(inspecao.id)
        .flatMap((_) => getManyByCds(acoes.map((e) => e.cdAcaoTomada).toList()))
        .map((dbAcoesTomadas) => _toConclusion(dbAcoesTomadas, acoes, inspecao))
        .flatMap((dbConclusoes) => _databaseService.putAndGetMany<DbAcaoTomadaConclusao>(dbConclusoes));
  }

  List<DbAcaoTomadaConclusao> _toConclusion(List<DbAcaoTomada> referenceModels, List<AcaoTomadaConclusao> entities, DbInspecaoConclusao inspecao){
    final dbConclusoes = entities.map((e) {
      final dbConclusao = DbAcaoTomadaConclusao(dsObservacao: e.dsObservacao,dtEfetivacao: e.dtEfetivacao);
      dbConclusao.inspecao.target = inspecao;
      dbConclusao.acaoTomada.target = referenceModels.firstWhereOrNull((model) => model.cdAcaoTomada == e.cdAcaoTomada);
      return dbConclusao;
    }).toList();
    return dbConclusoes;
  }

}