import 'package:objectbox/objectbox.dart';
import 'package:smaservicos/app/domain/entities/todo/todo.dart';

@Entity()
class DbTodo {
  @Id()
  int id;
  String description;
  @Property(type: PropertyType.date)
  DateTime createdAt;
  @Property(type: PropertyType.date)
  DateTime? endedAt;
  @Property(type: PropertyType.date)
  DateTime? deletedAt;
  int priority;

  DbTodo({
    this.id = 0,
    required this.description,
    required this.createdAt,
    required this.priority,
    this.endedAt,
    this.deletedAt,
  });

  Todo toEntity() {
    return Todo(
      id: id,
      description: description,
      createdAt: createdAt,
      endedAt: endedAt,
      deletedAt: deletedAt,
      priority: priority,
    );
  }

  DbTodo copyWith({
    int? id,
    String? description,
    DateTime? createdAt,
    DateTime? endedAt,
    DateTime? deletedAt,
    int? priority
  }) {
    return DbTodo(
      id: id ?? this.id,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      endedAt: endedAt ?? this.endedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      priority: priority ?? this.priority,
    );
  }
}
