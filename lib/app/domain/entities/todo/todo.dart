import 'package:smaservicos/app/data/models/todo/database/db_todo.dart';
class Todo {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime? endedAt;
  final DateTime? deletedAt;

  Todo({this.endedAt, this.deletedAt, required this.id, required this.description, required this.createdAt});

  factory Todo.fromTodoModel(Todo model) {
    return Todo(
      id: model.id ?? 0,
      description: model.description,
      createdAt: model.createdAt,

    );
  }
  factory Todo.fromMovieLocalModel(DbTodo model){
    return Todo(
      id: model.id ?? 0,
      description: model.description,
      createdAt: model.createdAt,
      endedAt: model.endedAt,
      deletedAt: model.deletedAt,
    );
  }

  Todo copyWith({int? id, String? description, DateTime? createdAt, DateTime? endedAt, DateTime? deletedAt}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      endedAt: endedAt ?? this.endedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
