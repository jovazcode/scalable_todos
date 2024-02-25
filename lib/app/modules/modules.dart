import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:scalable_todos/app/modules/main.dart';
import 'package:scalable_todos/app/modules/stats.dart';
import 'package:scalable_todos/app/modules/todos.dart';

/// Modules
abstract class AppModules {
  static final list = [
    MainModule.module,
    TodosModule.module,
    StatsModule.module,
  ];

  /// App-scoped Repositories
  static List<RepositoryProvider<dynamic>> get repos =>
      [for (final module in list) ...module.repos];

  /// App-scoped Blocs
  static List<BlocProvider> get blocs =>
      [for (final module in list) ...module.blocs];
}

/// AppRoutes
abstract class AppRoutes {
  /// GoRouter Config
  static final routerConfig = GoRouter(
    initialLocation: app.mainPage.path,
    routes: [
      for (final module in AppModules.list) ...module.routes,
    ],
  );

  /// Modules
  static final app = MainModule.module;
  static final todos = TodosModule.module;
  static final stats = StatsModule.module;
}

/// Module Base
abstract class ModuleBase {
  ModuleBase({
    this.repos = const [],
    this.blocs = const [],
    this.routes = const [],
  });

  /// App-scoped Repositories
  final List<RepositoryProvider<dynamic>> repos;

  /// App-scoped Blocs
  final List<BlocProvider> blocs;

  /// Module Routes
  final List<GoRoute> routes;
}
