import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_domain/todos_domain.dart';

/// A Value Object
class StatsValueObject extends ValueObject implements Stats {
  /// Create from data
  StatsValueObject.fromMap(Map<String, dynamic> data)
      : completedTodos = (data[StatsKey.completedTodos.name] as int?) ?? 0,
        activeTodos = (data[StatsKey.activeTodos.name] as int?) ?? 0,
        super.fromMap(
          data: data,
        );

  @override
  final int completedTodos;

  @override
  final int activeTodos;
}
