/// To-do Attributes
enum TodoKey {
  id,
  title,
  description,
  completed,
}

/// A To-do (entity)
abstract class Todo {
  /// The unique identifier of the `todo`.
  ///
  /// Cannot be empty.
  String get id;

  /// The title of the `todo`.
  ///
  /// Note that the title may be empty.
  String get title;

  /// The description of the `todo`.
  ///
  /// Defaults to an empty string.
  String get description;

  /// Whether the `todo` is completed.
  ///
  /// Defaults to `false`.
  bool get isCompleted;

  /// Returns a copy of this `todo` with the given values updated.
  Todo copyWith(Map<TodoKey, dynamic> data);

  /// Returns a map representation of internal data.
  Map<String, dynamic> get toMap;
}
