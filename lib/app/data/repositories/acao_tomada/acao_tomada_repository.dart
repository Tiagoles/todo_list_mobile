import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smaservicos/app/data/models/acao_tomada/api/conclusao/acao_tomada_conclusao.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/services/acao_tomada/acao_tomada_client.dart';
import 'package:smaservicos/app/data/services/acao_tomada/acao_tomada_database_service.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/domain/entities/acao_tomada/acao_tomada.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';

class AcaoTomadaRepository {
  final AcaoTomadaDatabaseService _database;
  final AcaoTomadaClient _client;
  final ConnectivityService _connectivityService;
  final BehaviorSubject<List<AcaoTomada>> _items = BehaviorSubject.seeded([]);

  List<AcaoTomada> get items => _items.value;

  AcaoTomadaRepository(this._database, this._client, this._connectivityService);

  AsyncResult<List<AcaoTomada>> saveLocal(List<AcaoTomada> items) async {
    return _database.saveAll(items).onSuccess(_items.add);
  }

  AsyncResult<List<AcaoTomada>> sync() async {
    return _connectivityService.isConnected()
        .flatMap((isConnected) => isConnected ? syncRemote() : syncLocal());
  }

  AsyncResult<List<AcaoTomada>> syncRemote() async {
    final result = await _client.getAll()
        .map((result) =>  result.map((item) => item.toEntity()).toList())
        .flatMap(saveLocal);

    return result.isError() ? syncLocal() : result;
  }

  AsyncResult<List<AcaoTomada>> syncLocal() async {
    return _database.getAll().onSuccess(_items.add);
  }

  AsyncResult<List<AcaoTomadaConclusao>> saveConclusao(List<AcaoTomadaConclusao> acoes, InspecaoConclusao inspecao){
    return _database.saveConclusao(acoes, DbInspecaoConclusao.fromEntity(inspecao)).map((conclusoes) =>
        conclusoes.map((conclusao) => conclusao.toEntity()).toList());
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _database.resetConclusao(idInspecao);
  }

}