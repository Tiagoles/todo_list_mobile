import 'package:objectbox/objectbox.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/models/todo/database/db_todo.dart';
import 'package:smaservicos/app/data/models/todo/database/db_todo_filter.dart';

import '../../domain/entities/todo/todo.dart';
import 'core/database_service.dart';

class TodoService {
  final DatabaseService _databaseService;

  TodoService(this._databaseService);

  AsyncResult<List<DbTodo>> getAll() async {
    final result = await _databaseService.store.box<DbTodo>().getAllAsync();
    return Success(result);
  }

  AsyncResult<QueryBuilder<DbTodo>> filterQuery(DbTodoFilter? filter) async {
    Condition<DbTodo> condition = DbTodo_.description.notNull().and(DbTodo_.deletedAt.isNull());

    if (filter != null) {
      if (filter.id != null) {
        condition = condition.and(DbTodo_.id.equals(filter.id!));
      }

      if (filter.description != null) {
        condition = condition.and(
          DbTodo_.description.contains(
            filter.description!,
            caseSensitive: false,
          ),
        );
      }
    }

    QueryBuilder<DbTodo> builder = _databaseService.store.box<DbTodo>().query(
      condition,
    );

    return Success(builder);
  }

  AsyncResult<QueryBuilder<DbTodo>> listenTodos() async {
    final conditions = DbTodo_.description.notNull();
    final queryBuilder = _databaseService.store.box<DbTodo>().query(conditions);
    return Success(queryBuilder);
  }

  AsyncResult<DbTodo> saveTodo(Todo data) async {
    final box = _databaseService.store.box<DbTodo>();
    final todo = DbTodo(
      createdAt: data.createdAt,
      description: data.description,
      endedAt: data.endedAt,
      deletedAt: data.deletedAt,
      id: data.id,
    );

    final id = await box.putAsync(todo);
    final result = await box.getAsync(id);
    if (result != null) {
      return Success(result);
    }
    return Failure(Exception('Erro ao salvar tarefa.'));
  }

  AsyncResult<Unit> deleteTodo(Todo data) async {
    try {
      final box = _databaseService.store.box<DbTodo>();

      final todo = DbTodo(
        id: data.id,
        description: data.description,
        createdAt: data.createdAt,
        endedAt: data.endedAt,
        deletedAt: DateTime.now(),
      );

      await box.putAsync(todo);
      return const Success(unit);
    } catch (e) {
      return Failure(Exception('Erro deletar tarefa: $e'));
    }
  }

}
