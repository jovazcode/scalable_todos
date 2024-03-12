import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_api/todos_api.dart';

import 'package:todos_data/todos_data.dart';

import 'package:todos_domain/todos_domain.dart';

/// Repository
class TodosRepositoryImpl extends TodosRepository {
  /// Repository
  TodosRepositoryImpl({required TodosApi api})
      : super(dataSource: TodosDataSource(api: api));

  /// From domain
  @override
  Dto<Todo> fromDomain(Todo todo) => TodoDTO.fromDomain(todo);

  /// To domain
  @override
  Todo toDomain(Dto<Todo> dto) => TodoDTO.fromMap(dto.toMap).toDomain();

  /// Clear Completed
  @override
  Future<void> clearCompleted() async =>
      (dataSource as TodosDataSource).clearCompleted();

  /// Set all completed
  @override
  Future<void> setAllCompleted({required bool value}) =>
      (dataSource as TodosDataSource).setAllCompleted(value: value);
}
