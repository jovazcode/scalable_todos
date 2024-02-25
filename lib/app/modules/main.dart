// ignore_for_file: library_private_types_in_public_api

import 'package:scalable_todos/app/modules/modules.dart';

import 'package:scalable_todos/pages/pages.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// "Main" Module.
class MainModule {
  static final _MainModule module = _MainModule(
    mainPage: GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
  );
}

class _MainModule extends ModuleBase {
  _MainModule({
    required this.mainPage,
  }) : super(
          repos: [
            RepositoryProvider<TodosRepository>.value(
              value: getIt.get<TodosRepository>(),
            ),
          ],
          routes: [mainPage],
        );

  /// 'MainPage' Route
  final GoRoute mainPage;
}
