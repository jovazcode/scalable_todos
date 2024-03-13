import 'package:clean_foundations/clean_foundations.dart';

/// Stats (value object)
class Stats extends ValueObject {
  Stats({
    int? completedTodos,
    int? activeTodos,
  }) : super.fromMap(
          data: {
            'completedTodos': completedTodos,
            'activeTodos': activeTodos,
          },
        );

  /// The number of completed `todo`.
  int get completedTodos => get<int>('completedTodos') ?? 0;

  /// The number of active `todo`.
  int get activeTodos => get<int>('activeTodos') ?? 0;
}
