import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_api/todos_api.dart';

import 'package:todos_data/src/datasources/datasources.dart';

import 'package:todos_domain/todos_domain.dart';

/// Repository
class TodosRepositoryImpl extends Repository<Todo>
    with
        CreateRecords<Todo>,
        UpdateRecords<Todo>,
        DeleteRecords<Todo>,
        StreamRecords<Todo>
    implements TodosRepository {
  /// Repository
  TodosRepositoryImpl({required TodosApi api})
      : super(
          dataSource: TodosDataSource(api: api),
        );

  /// Clear Completed
  @override
  Future<void> clearCompleted() async {
    await (dataSource as TodosDataSource).clearCompleted();
    return;
  }

  /// Set all completed
  @override
  Future<void> setAllCompleted({required bool value}) async {
    await (dataSource as TodosDataSource).setAllCompleted(value: value);
    return;
  }
}
