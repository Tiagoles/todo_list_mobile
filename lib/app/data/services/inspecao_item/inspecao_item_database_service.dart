import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/conclusao/inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item.dart';
import 'package:smaservicos/app/data/models/inspecao_item/database/db_inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';

class InspecaoItemDatabaseService {
  final DatabaseService _databaseService;

  InspecaoItemDatabaseService(this._databaseService);

  AsyncResult<List<InspecaoItem>> saveAll(List<InspecaoItem> items) async {
    final tasks = items.map((item) async {
      final id = (await getByCd(item.cdItemInspecionado)).getOrNull()?.id;
      return DbInspecaoItem.fromEntity(item, id: id ?? 0);
    });

    final itemsToSave = await Future.wait(tasks);

    return _databaseService.putMany<DbInspecaoItem>(itemsToSave).pure(items);
  }

  AsyncResult<InspecaoItem> save(InspecaoItem item) async {
    final id = (await getByCd(item.cdItemInspecionado)).getOrNull()?.id;
    return _databaseService.put<DbInspecaoItem>(DbInspecaoItem.fromEntity(item, id: id ?? 0)).pure(item);
  }

  AsyncResult<List<InspecaoItem>> getAll() async {
    return await _databaseService.getAll<DbInspecaoItem>()
      .map((items) => items.map((e) => e.toEntity()).toList());
  }

  AsyncResult<Unit> reset() async {
    return _databaseService.reset<DbInspecaoItem>();
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _databaseService.query<DbInspecaoItemConclusao>(DbInspecaoItemConclusao_.inspecao.equals(idInspecao))
    .map((query){
      query.remove();
      return unit;
    });
  }

  AsyncResult<List<DbInspecaoItem>> getManyByCds(List<int> cds) async {
    return _databaseService.query<DbInspecaoItem>(DbInspecaoItem_.cdItemInspecionado.oneOf(cds))
        .map((query) => query.findAsync());
  }

  AsyncResult<DbInspecaoItem> getByCd(int cdItemInspecionado) async {
    return await _databaseService.query<DbInspecaoItem>(DbInspecaoItem_.cdItemInspecionado.equals(cdItemInspecionado))
        .flatMap((query) async {
      final result = await query.findFirstAsync();
      if (result == null) {
        return Failure(LocalDatabaseException('Inspeção com número $cdItemInspecionado não encontrada.'));
      }
      return Success(result);
    });
  }

  AsyncResult<List<DbInspecaoItemConclusao>> saveConclusao(List<InspecaoItemConclusao> acoes, DbInspecaoConclusao inspecao){
    return resetConclusao(inspecao.id)
    .flatMap((_) => getManyByCds(acoes.map((e) => e.cdItemInspecionado).toList()))
    .map((dbAcoesTomadas) => _toConclusion(dbAcoesTomadas, acoes, inspecao))
    .flatMap((dbConclusoes) => _databaseService.putAndGetMany<DbInspecaoItemConclusao>(dbConclusoes));
  }

  List<DbInspecaoItemConclusao> _toConclusion(List<DbInspecaoItem> referenceModels, List<InspecaoItemConclusao> entities, DbInspecaoConclusao inspecao){
    final dbConclusoes = entities.map((e) {
      final dbConclusao = DbInspecaoItemConclusao(flProcedenteImprocedente: e.flProcedenteImprocedente);
      dbConclusao.inspecao.target = inspecao;
      dbConclusao.inspecaoItem.target = referenceModels.firstWhereOrNull((model) => model.cdItemInspecionado == e.cdItemInspecionado);
      return dbConclusao;
    }).toList();
    return dbConclusoes;
  }

}