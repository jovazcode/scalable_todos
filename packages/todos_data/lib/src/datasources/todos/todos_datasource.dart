import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_api/todos_api.dart';

import 'package:todos_data/src/datasources/todos/todo_reader.dart';
import 'package:todos_data/src/datasources/todos/todo_writer.dart';
import 'package:todos_data/src/models/models.dart';

import 'package:todos_domain/todos_domain.dart';

/// DataSource
class TodosDataSource extends DataSource<Todo> {
  TodosDataSource({required this.api})
      : super(
          reader: TodoJsonDataReader(),
          writer: TodoJsonDataWriter(),
        );

  // [Todo]s API
  final TodosApi api;

  // Current filters
  final List<DataFilter<dynamic>> _filters = [];

  /// Create new [data] records.
  @override
  Future<ResultSet<TodoEntity>> create(
    List<RawData> data,
  ) async {
    try {
      final created = <TodoEntity>[];
      for (final record in data) {
        assert(
          record.get<String>(TodoKey.id.name) == null,
          '''Record already created, id=${record.get<String>(TodoKey.id.name)}.''',
        );
        created.add(TodoEntity.fromMap(record.toMap));
        await api.saveTodo(created.last);
      }
      return ResultSet(records: created);
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Update given [records].
  @override
  Future<ResultSet<TodoEntity>> update(List<Todo> records) async {
    try {
      final updated = <TodoEntity>[];
      for (final record in records.cast<TodoEntity>()) {
        assert(
          record.get<String>(TodoKey.id.name) != null,
          '''Invalid record, id=null ($record).''',
        );
        updated.add(record);
        await api.saveTodo(record);
      }
      return ResultSet(records: updated);
    } on TodoNotFoundException catch (excp) {
      throw DataException(message: 'Todo not found', exception: excp);
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Delete given [records].
  @override
  Future<ResultSet<TodoEntity>> delete(List<Todo> records) async {
    try {
      final deleted = <TodoEntity>[];
      for (final record in records.cast<TodoEntity>()) {
        assert(
          record.get<String>(TodoKey.id.name) != null,
          '''Invalid record, id=null ($record).''',
        );
        deleted.add(record);
        await api.deleteTodo(record.get<String>(TodoKey.id.name)!);
      }
      return ResultSet(records: deleted);
    } on TodoNotFoundException catch (excp) {
      throw DataException(message: 'Todo not found', exception: excp);
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Filter current 'records'.
  @override
  Future<ResultSet<TodoEntity>> filter({
    required List<DataFilter<dynamic>> filters,
  }) async {
    // Update current filters
    _filters
      ..clear()
      ..addAll(filters);

    final dataList = api.listAllTodos();
    final filteredDataList = _filters.isEmpty
        ? dataList
        : dataList.where(
            (data) => !_filters.any((filter) => !data.matchFilter(filter)),
          );

    try {
      final res = filteredDataList
          .map((data) => TodoEntity.fromMap(data.toMap))
          .toList();
      return ResultSet(records: res);
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Stream of records.
  @override
  Stream<List<TodoEntity>> watch({
    Pagination? pagination,
    List<DataFilter<dynamic>>? filters,
    List<DataSorter<dynamic>>? sorters,
  }) async* {
    // Update current filters
    _filters
      ..clear()
      ..addAll(filters ?? []);

    // Start streaming!...
    try {
      yield* api.getTodos().map((dataList) {
        final filteredDataList = _filters.isEmpty
            ? dataList
            : dataList.where(
                (data) => !_filters.any((filter) => !data.matchFilter(filter)),
              );
        try {
          final res = filteredDataList
              .map((data) => TodoEntity.fromMap(data.toMap))
              .toList();
          return res;
        } on Exception catch (excp) {
          throw RemoteException(exception: excp);
        }
      });
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Clear Completed
  Future<void> clearCompleted() async {
    try {
      await api.clearCompleted();
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }

  /// Set all completed
  Future<void> setAllCompleted({required bool value}) async {
    try {
      await api.completeAll(isCompleted: value);
    } on Exception catch (excp) {
      throw RemoteException(exception: excp);
    }
  }
}
