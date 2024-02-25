import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todos_api/todos_api.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

/// {@template todo_item}
/// A single `todo` item.
///
/// Contains a [title], [description] and [id], in addition to a [isCompleted]
/// flag.
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [TodoModelx]s are immutable and can be copied using [copyWith],
/// in addition to being serialized and deserialized using [toJson]
/// and [fromJson] respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class TodoModelx extends Equatable {
  /// {@macro todo_item}
  TodoModelx({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id must either be null or not empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the `todo`.
  ///
  /// Cannot be empty.
  final String id;

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

  /// Returns a copy of this `todo` with the given values updated.
  ///
  /// {@macro todo_item}
  TodoModelx copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TodoModelx(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Deserializes the given [JsonMapx] into a [TodoModelx].
  static TodoModelx fromJson(JsonMapx json) => _$TodoFromJson(json);

  /// Converts this [TodoModelx] into a [JsonMapx].
  JsonMapx toJson() => _$TodoToJson(this);

  @override
  List<Object> get props => [id, title, description, isCompleted];
}
