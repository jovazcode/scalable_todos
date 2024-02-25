/// Stats Attributes
enum StatsKey {
  completedTodos,
  activeTodos,
}

/// Stats (value object)
abstract class Stats {
  /// The number of completed `todo`.
  int get completedTodos;

  /// The number of active `todo`.
  int get activeTodos;
}
