import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/evento_servico/database/db_evento_servico.dart';
import 'package:smaservicos/app/data/services/evento_servico/evento_servico_client.dart';
import 'package:smaservicos/app/data/services/evento_servico/evento_servico_database_service.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';

class EventoServicoRepository{

  final EventoServicoClient _client;
  final EventoServicoDatabaseService _database;

  EventoServicoRepository(this._client, this._database);

  Stream<List<EventoServico>> watch(){
    return _database.watchQuery()
      .map((q)=>q.find())
      .map((models) => models.map((e) => e.toEntity()).toList());
  }

  AsyncResult<List<EventoServico>> sync() async {
    return _client.getAll()
      .flatMap(saveLocal)
      .flatMapError((e) => getAll());
  }

  AsyncResult<List<EventoServico>> getAll() async {
    return _database.getAll()
      .map((models) => models.map((e) => e.toEntity()).toList());
  }

  AsyncResult<List<EventoServico>> saveLocal(List<EventoServico> items) async {
    return _database.saveAll(items.map((e) => DbEventoServico.fromEntity(e)).toList())
      .map((models) => models.map((e) => e.toEntity()).toList());
  }

}