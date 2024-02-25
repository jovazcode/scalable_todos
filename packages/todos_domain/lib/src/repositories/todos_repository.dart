import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_domain/src/models/entities/entities.dart';

/// Repository
abstract class TodosRepository extends Repository<Todo>
    with
        CreateRecords<Todo>,
        UpdateRecords<Todo>,
        DeleteRecords<Todo>,
        StreamRecords<Todo> {
  /// Repository
  TodosRepository({required super.dataSource});

  /// Clear Completed
  Future<void> clearCompleted();

  /// Set all completed
  Future<void> setAllCompleted({required bool value});
}
