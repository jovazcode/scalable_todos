import 'package:clean_foundations/clean_foundations.dart';

/// Stats (value object)
class Stats extends Model {
  Stats({
    required this.completedTodos,
    required this.activeTodos,
  });

  /// The number of completed `todo`.
  final int completedTodos;

  /// The number of active `todo`.
  final int activeTodos;
}
