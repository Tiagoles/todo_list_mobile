import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/exceptions/core_exceptions.dart';
import 'package:smaservicos/app/data/models/evento_servico/database/db_evento_servico.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/services/core/database_service.dart';
import 'package:smaservicos/app/domain/entities/evento_servico/evento_servico.dart';

class EventoServicoDatabaseService {
  final DatabaseService _databaseService;

  EventoServicoDatabaseService(this._databaseService);

  Stream<Query<DbEventoServico>> watchQuery({Condition<DbEventoServico>? conditions, bool triggerImmediately = true}){
    Condition<DbEventoServico> newConditions = conditions ?? DbEventoServico_.id.notNull();
    newConditions = newConditions.and(DbEventoServico_.dsEvento.notNull())
      .and(DbEventoServico_.flAtivoInativo.equals('A'));
    return _databaseService.watchQuery<DbEventoServico>(conditions: conditions, triggerImmediately: triggerImmediately);
  }

  AsyncResult<List<DbEventoServico>> saveAll(List<DbEventoServico> items) async {
    final tasks = items.map((item) async {
      final id = (await getByCd(item.cdEvento)).getOrNull()?.id;
      item.id = id ?? 0;
      return item;
    });

    final itemsToSave = await Future.wait(tasks);
    return _databaseService.putAndGetMany<DbEventoServico>(itemsToSave);
  }

  AsyncResult<EventoServico> save(EventoServico item) async {
    final id = (await getByCd(item.cdEvento)).getOrNull()?.id;
    return _databaseService.put<DbEventoServico>(DbEventoServico.fromEntity(item, id: id ?? 0)).pure(item);
  }

  AsyncResult<List<DbEventoServico>> getAll() async {
    return await _databaseService.getAll<DbEventoServico>();
  }

  AsyncResult<Unit> reset() async {
    return _databaseService.reset<DbEventoServico>();
  }

  AsyncResult<List<DbEventoServico>> getManyByCds(List<int> cds) async {
    return _databaseService.query<DbEventoServico>(DbEventoServico_.cdEvento.oneOf(cds))
        .map((query) => query.findAsync());
  }

  AsyncResult<DbEventoServico> getByCd(int cdEvento) async {
    return await _databaseService.query<DbEventoServico>(DbEventoServico_.cdEvento.equals(cdEvento))
        .flatMap((query) async {
      final result = await query.findFirstAsync();
      if (result == null) {
        return Failure(LocalDatabaseException('Inspeção com número $cdEvento não encontrada.'));
      }
      return Success(result);
    });
  }

}