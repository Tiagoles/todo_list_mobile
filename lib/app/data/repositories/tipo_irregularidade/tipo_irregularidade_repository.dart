import 'package:result_dart/result_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:smaservicos/app/data/models/inspecao/database/conclusao/db_inspecao_conclusao.dart';
import 'package:smaservicos/app/data/models/tipo_irregularidade/api/conclusao/tipo_irregularidade_conclusao.dart';
import 'package:smaservicos/app/data/services/core/connectivity_service.dart';
import 'package:smaservicos/app/data/services/tipo_irregularidade/tipo_irregularidade_client.dart';
import 'package:smaservicos/app/data/services/tipo_irregularidade/tipo_irregularidade_database_service.dart';
import 'package:smaservicos/app/domain/entities/inspecao/conclusao/inspecao_conclusao.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';

class TipoIrregularidadeRepository {
  final TipoIrregularidadeDatabaseService _database;
  final TipoIrregularidadeClient _client;
  final ConnectivityService _connectivityService;
  final BehaviorSubject<List<TipoIrregularidade>> _items = BehaviorSubject.seeded([]);

  TipoIrregularidadeRepository(this._database, this._client, this._connectivityService);

  List<TipoIrregularidade> get items => _items.value;

  AsyncResult<List<TipoIrregularidade>> saveLocal(List<TipoIrregularidade> items) async {
    return _database.saveAll(items).onSuccess(_items.add);
  }

  AsyncResult<List<TipoIrregularidade>> sync() async {
    return _connectivityService.isConnected()
        .flatMap((isConnected) => isConnected ? syncRemote() : syncLocal());
  }

  AsyncResult<List<TipoIrregularidade>> syncRemote() async {
    final result = await _client.getAll()
        .map((result) =>  result.map((item) => item.toEntity()).toList())
        .flatMap(saveLocal);

    return result.isError() ? syncLocal() : result;
  }

  AsyncResult<List<TipoIrregularidade>> syncLocal() async {
    return _database.getAll().onSuccess(_items.add);
  }

  AsyncResult<List<TipoIrregularidadeConclusao>> saveConclusao(List<TipoIrregularidadeConclusao> acoes, InspecaoConclusao inspecao){
    return _database.saveConclusao(acoes, DbInspecaoConclusao.fromEntity(inspecao))
      .map((conclusoes) => conclusoes.map((conclusao) => conclusao.toEntity()).toList());
  }

  AsyncResult<Unit> resetConclusao(int idInspecao) async {
    return _database.resetConclusao(idInspecao);
  }

}