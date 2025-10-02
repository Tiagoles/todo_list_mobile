import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/api/conclusao/tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/database/db_tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';

class TipoIrregularidadeDatabaseService {
  final DatabaseService _databaseService;

  TipoIrregularidadeDatabaseService(this._databaseService);

  AsyncResult<List<TipoIrregularidade>> saveAll(List<TipoIrregularidade> items) async {
    final tasks = items.map((item) async {
      final id = (await getByCd(item.cdTipoIrregularidade)).getOrNull()?.id;
      return DbTipoIrregularidade.fromEntity(item, id: id ?? 0);
    });

    final itemsToSave = await Future.wait(tasks);
    return _databaseService.putMany<DbTipoIrregularidade>(itemsToSave).pure(items);
  }

  AsyncResult<TipoIrregularidade> save(TipoIrregularidade item) async {
    final id = (await getByCd(item.cdTipoIrregularidade)).getOrNull()?.id;
    return _databaseService.put<DbTipoIrregularidade>(DbTipoIrregularidade.fromEntity(item, id: id ?? 0)).pure(item);
  }

  AsyncResult<List<TipoIrregularidade>> getAll() async {
    return await _databaseService.getAll<DbTipoIrregularidade>()
      .map((items) => items.map((e) => e.toEntity()).toList());
  }

  AsyncResult<Unit> reset() async {
    return _databaseService.reset<DbTipoIrregularidade>();
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _databaseService.query<DbTipoIrregularidadeConclusao>(DbTipoIrregularidadeConclusao_.inspecao.equals(idInspecao))
        .map((query){
      query.remove();
      return unit;
    });
  }

  AsyncResult<List<DbTipoIrregularidade>> getManyByCds(List<int> cds) async {
    return _databaseService.query<DbTipoIrregularidade>(DbTipoIrregularidade_.cdTipoIrregularidade.oneOf(cds))
        .map((query) => query.findAsync());
  }

  AsyncResult<DbTipoIrregularidade> getByCd(int cdItemInspecionado) async {
    return await _databaseService.query<DbTipoIrregularidade>(DbTipoIrregularidade_.cdTipoIrregularidade.equals(cdItemInspecionado))
        .flatMap((query) async {
      final result = await query.findFirstAsync();
      if (result == null) {
        return Failure(LocalDatabaseException('Inspeção com número $cdItemInspecionado não encontrada.'));
      }
      return Success(result);
    });
  }

  AsyncResult<List<DbTipoIrregularidadeConclusao>> saveConclusao(List<TipoIrregularidadeConclusao> acoes, DbInspecaoConclusao inspecao){
    return resetConclusao(inspecao.id)
        .flatMap((_) => getManyByCds(acoes.map((e) => e.cdTipoIrregularidade).toList()))
        .map((dbAcoesTomadas) => _toConclusion(dbAcoesTomadas, acoes, inspecao))
        .flatMap((dbConclusoes) => _databaseService.putAndGetMany<DbTipoIrregularidadeConclusao>(dbConclusoes));
  }

  List<DbTipoIrregularidadeConclusao> _toConclusion(List<DbTipoIrregularidade> referenceModels, List<TipoIrregularidadeConclusao> entities, DbInspecaoConclusao inspecao){
    final dbConclusoes = entities.map((e) {
      final dbConclusao = DbTipoIrregularidadeConclusao(dsObservacao: e.dsObservacao);
      dbConclusao.inspecao.target = inspecao;
      dbConclusao.tipoIrregularidade.target = referenceModels.firstWhereOrNull((model) => model.cdTipoIrregularidade == e.cdTipoIrregularidade);
      return dbConclusao;
    }).toList();
    return dbConclusoes;
  }

}