import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/data/models/objectbox/objectbox.g.dart';
import 'package:smaservicos/app/data/models/todo/database/db_todo_filter.dart';
import 'package:smaservicos/app/domain/entities/todo/todo.dart';

import '../services/todo_service.dart';

class TodoRepository {
  final TodoService _service;

  TodoRepository(this._service);

  AsyncResult<List<Todo>> getAllTodos() async {
    return _service.getAll().map(
      (data) => data.map((db) => db.toEntity()).toList(),
    );
  }

  AsyncResult<Stream<List<Todo>>> watch([DbTodoFilter? filter]) async {
    return _service
        .filterQuery(filter)
        .map(
          (q) => q
              .order(DbTodo_.id)
              .watch(triggerImmediately: true)
              .map((q) => q.find().map((list) => list.toEntity()).toList()),
        );
  }

  AsyncResult<Todo> saveTodo(Todo todo) async {
    return await _service.saveTodo(todo).map((dbTodo) => dbTodo.toEntity());
  }

  AsyncResult<Unit> deleteTodo(Todo todo) async {
    try {
      await _service.deleteTodo(todo);

      return const Success(unit);
    } catch (e) {
      return Failure(Exception('Erro ao excluir todo: $e'));
    }
  }
}
