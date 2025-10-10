import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/todo/todo.dart';
import '../../../data/repositories/todo_repository.dart';
import '../../../utils/command.dart';

class TodoViewmodel extends ChangeNotifier {
  final TodoRepository _repository;
  final todos = ValueNotifier<List<Todo>>([]);
  late final Command0<List<Todo>> getCommand;
  late final Command1<Todo, Todo> saveCommand;
  late final Command1<Unit, Todo> deleteCommand;
  late final Command1<Todo, int> findByIdCommand;

  TodoViewmodel(this._repository) {
    getCommand = Command0(_repository.getAllTodos);
    getCommand.execute();
    _repository.watch().onSuccess((stream) {
      stream.listen((data) async {
        todos.value = data;
      });
    });

    saveCommand = Command1(_saveTodo);
    deleteCommand = Command1(deleteTodo);
    findByIdCommand = Command1(_repository.findById);
  }

  AsyncResult<Todo> _saveTodo(Todo todo) async {
    return await _repository.saveTodo(todo);
  }

  AsyncResult<Unit> deleteTodo(Todo todo) async {
    final Todo task = todo.copyWith(deletedAt: DateTime.now());
    return await _repository.deleteTodo(task);
  }

  void updateTodo(Todo todo) async {
     saveCommand.execute(todo);
  }

  void toggleEndedAt(Todo todo) async {
    DateTime? endedAt = todo.endedAt;
    endedAt = endedAt == null ? DateTime.now() : null;
    saveCommand.execute(todo.copyWith(endedAt: endedAt));
  }

}
