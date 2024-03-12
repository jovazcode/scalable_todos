import 'package:clean_foundations/clean_foundations.dart';

/// A To-do (entity)
class Todo extends Entity<String> {
  Todo({
    required this.title,
    super.id,
    this.description = '',
    this.isCompleted = false,
  });

  /// Copy with
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) =>
      Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  /// The title of the `todo`.
  ///
  /// Note that the title may be empty.
  final String title;

  /// The description of the `todo`.
  ///
  /// Defaults to an empty string.
  final String description;

  /// Whether the `todo` is completed.
  ///
  /// Defaults to `false`.
  final bool isCompleted;
}
