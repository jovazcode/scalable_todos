// 'Todos' Local Storage API Implementation
import 'package:local_storage_todos_api/local_storage_todos_api.dart';

// App Global Imports
import 'package:scalable_todos/scalable_todos.dart';

// 'Todos' Data Layer (implementation of the Domain Layer)
import 'package:todos_data/todos_data.dart';

/// Init dependencies
Future<void> initDependencies() async {
  final sharedPreferencies = await SharedPreferences.getInstance();

  /// [LocalStorageTodosApi] based on `SharedPreferencies`
  getIt
    ..registerLazySingleton<LocalStorageTodosApi>(
      () => LocalStorageTodosApi(
        plugin: sharedPreferencies,
      ),
    )

    /// [TodosRepository] based on `LocalStorageTodosApi`
    ..registerLazySingleton<TodosRepository>(
      () => TodosRepositoryImpl(
        api: getIt.get<LocalStorageTodosApi>(),
      ),
    );
}
