import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smaservicos/app/data/models/todo/database/db_todo.dart';

class Todo {
  final int id;
  final String description;
  final DateTime createdAt;
  final DateTime? endedAt;
  final DateTime? deletedAt;
  final int priority;

  Todo({required this.priority, this.endedAt, this.deletedAt, required this.id, required this.description, required this.createdAt});

  factory Todo.fromTodoModel(Todo model) {
    return Todo(
      id: model.id,
      description: model.description,
      createdAt: model.createdAt,
      priority: model.priority
    );
  }

  factory Todo.fromDb(DbTodo model){
    return Todo(
      id: model.id,
      description: model.description,
      createdAt: model.createdAt,
      endedAt: model.endedAt,
      deletedAt: model.deletedAt,
      priority: model.priority
    );
  }

  Todo copyWith({int? id, String? description, DateTime? createdAt, DateTime? endedAt, DateTime? deletedAt, int? priority}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      endedAt: this.endedAt ?? endedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      priority: priority ?? this.priority
    );
  }

  Todo copyFromForm(Map<String, dynamic> form){
    return Todo(
      id: form['id'] ?? id,
      description: form['descricao'] ?? description,
      createdAt: form['createdAt'] ?? createdAt,
      endedAt: form['endedAt'] ?? endedAt,
      deletedAt: form['deletedAt'] ?? deletedAt,
      priority: form['priority'] ?? priority
    );
  }

}
