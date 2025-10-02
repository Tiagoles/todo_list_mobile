import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao_item/conclusao/inspecao_item_conclusao.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/data/services/inspecao_item/inspecao_item_client.dart';
import 'package:smaservicos/app/data/services/inspecao_item/inspecao_item_database_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/inspecao_item/inspecao_item.dart';

class InspecaoItemRepository {
  final InspecaoItemDatabaseService _database;
  final InspecaoItemClient _client;
  final ConnectivityService _connectivityService;
  final BehaviorSubject<List<InspecaoItem>> _items = BehaviorSubject.seeded([]);

  List<InspecaoItem> get items => _items.value;

  InspecaoItemRepository(this._database, this._client, this._connectivityService);

  AsyncResult<List<InspecaoItem>> saveLocal(List<InspecaoItem> items) async {
    return _database.saveAll(items).onSuccess(_items.add);
  }

  AsyncResult<List<InspecaoItem>> sync() async {
    return _connectivityService.isConnected()
        .flatMap((isConnected) => isConnected ? syncRemote() : syncLocal());
  }

  AsyncResult<List<InspecaoItem>> syncRemote() async {
    final result = await _client.getAll()
    .map((result) =>  result.map((item) => item.toEntity()).toList())
    .flatMap(saveLocal);

    return result.isError() ? syncLocal() : result;
  }

  AsyncResult<List<InspecaoItem>> syncLocal() async {
    return _database.getAll().onSuccess(_items.add);
  }

  AsyncResult<List<InspecaoItemConclusao>> saveConclusao(List<InspecaoItemConclusao> acoes, InspecaoConclusao inspecao){
    return _database.saveConclusao(acoes, DbInspecaoConclusao.fromEntity(inspecao)).map((conclusoes) =>
        conclusoes.map((conclusao) => conclusao.toEntity()).toList());
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _database.resetConclusao(idInspecao);
  }

}