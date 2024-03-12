import 'dart:async';
import 'dart:convert';

import 'package:clean_foundations/clean_foundations.dart';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_api/todos_api.dart';
import 'package:uuid/uuid.dart';

/// {@template local_storage_todos_api}
/// A Flutter implementation of the [TodosApi] that uses local storage.
/// {@endtemplate}
class LocalStorageTodosApi extends TodosApi {
  /// {@macro local_storage_todos_api}
  LocalStorageTodosApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _todoStreamController = BehaviorSubject<List<RawData>>.seeded(const []);

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kTodosCollectionKey = '__todos_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    _todoStreamController.add(_todos);
  }

  List<RawData> get _todos {
    final todosJson = _getValue(kTodosCollectionKey);

    if (todosJson != null) {
      final todos = (json.decode(todosJson) as List)
          .cast<Map<String, dynamic>>()
          .map((todoMap) => RawData.fromMap(data: todoMap))
          .toList();
      return todos;
    } else {
      return const [];
    }
  }

  @override
  List<RawData> listAllTodos() {
    // Resend current data value
    _todoStreamController.add(_todoStreamController.value);

    // Return current data value
    return _todoStreamController.value;
  }

  @override
  Stream<List<RawData>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Future<void> saveTodo(RawData todo) {
    final id = todo.get<String>('id') ?? const Uuid().v4();
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.get<String>('id') == id);

    // set
    if (todoIndex >= 0) {
      todos[todoIndex] = todo.mergeWith({'id': id});
    } else {
      todos.add(todo.mergeWith({'id': id}));
    }
    _todoStreamController.add(todos);

    // save
    return _setValue(kTodosCollectionKey, json.encode(todos));
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.get<String>('id') == id);
    if (todoIndex == -1) {
      throw TodoNotFoundException();
    } else {
      todos.removeAt(todoIndex);
      _todoStreamController.add(todos);
      return _setValue(kTodosCollectionKey, json.encode(todos));
    }
  }

  @override
  Future<int> clearCompleted() async {
    final todos = [..._todoStreamController.value];
    final completedTodosAmount =
        todos.where((t) => t.get<bool>('completed') ?? false).length;
    todos.removeWhere((t) => t.get<bool>('completed') ?? false);
    _todoStreamController.add(todos);
    await _setValue(kTodosCollectionKey, json.encode(todos));
    return completedTodosAmount;
  }

  @override
  Future<int> completeAll({required bool isCompleted}) async {
    final todos = [..._todoStreamController.value];
    final changedTodosAmount = todos
        .where((t) => t.get<bool>('completed') ?? false != isCompleted)
        .length;
    final newTodos = [
      for (final todo in todos) todo.mergeWith({'completed': isCompleted}),
    ];
    _todoStreamController.add(newTodos);
    await _setValue(kTodosCollectionKey, json.encode(newTodos));
    return changedTodosAmount;
  }
}
