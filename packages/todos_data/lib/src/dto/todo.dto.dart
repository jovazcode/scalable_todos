import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_domain/todos_domain.dart';

/// A To-Do DTO
class TodoDTO extends EntityDto<String, Todo> {
  /// Constructor
  TodoDTO.fromMap(DataMap data) : super.fromMap(data: data);

  TodoDTO.fromDomain(Todo model)
      : super.fromMap(
          data: {
            'id': model.id,
            'title': model.title,
            'description': model.description,
            'completed': model.isCompleted,
          },
        );

  String get title => get<String>('title') ?? '';
  String get description => get<String>('description') ?? '';
  bool get isCompleted => get<bool>('completed') ?? false;

  @override
  Todo toDomain() => Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
      );
}
