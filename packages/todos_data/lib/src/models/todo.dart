import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_domain/todos_domain.dart';

/// An Entity
class TodoEntity extends Entity<String> implements Todo {
  /// Create from data
  TodoEntity.fromMap(Map<String, dynamic> data)
      : title = (data[TodoKey.title.name] as String?) ?? '',
        description = (data[TodoKey.description.name] as String?) ?? '',
        isCompleted = (data[TodoKey.completed.name] as bool?) ?? false,
        super.fromMap(
          id: data[TodoKey.id.name] as String?,
          data: data,
        );

  /// Returns a copy of this `todo` with the given values updated.
  @override
  TodoEntity copyWith(Map<TodoKey, dynamic> data) => TodoEntity.fromMap(
        {...toMap, ...data.map((key, value) => MapEntry(key.name, value))},
      );

  @override
  final String title;

  @override
  final String description;

  @override
  final bool isCompleted;
}
