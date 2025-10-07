import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/todo/todo.dart';
import '../../../data/repositories/todo_repository.dart';
import '../../../utils/command.dart';

class TodoViewmodel extends ChangeNotifier {
  final TodoRepository _repository;
  final todos = ValueNotifier<List<Todo>>([]);
  late final Command0<List<Todo>> getCommand;
  late final Command2<Todo, Todo, bool?> saveCommand;
  late final Command1<Unit, Todo> deleteCommand;

  TodoViewmodel(this._repository) {
    getCommand = Command0(_repository.getAllTodos);
    getCommand.execute();
    _repository.watch().onSuccess((stream) {
      stream.listen((data) async {
        todos.value = data;
      });
    });

    saveCommand = Command2(_saveTodo);
    deleteCommand = Command1(deleteTodo);

  }

  AsyncResult<Todo> _saveTodo(Todo todo, bool? checked) async {
    final Todo task = todo.copyWith(endedAt: checked! ? DateTime.now() : null);
    return await _repository.saveTodo(task);
  }
  AsyncResult<Unit> deleteTodo(Todo todo) async{
    final Todo task = todo.copyWith(deletedAt: DateTime.now());
    return await _repository.deleteTodo(task);
  }
}
