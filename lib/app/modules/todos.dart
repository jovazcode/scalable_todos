// ignore_for_file: library_private_types_in_public_api

import 'package:scalable_todos/app/modules/modules.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/pages/pages.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// "Todos" Module.
class TodosModule {
  static final _TodosModule module = _TodosModule(
    editPage: GoRoute(
      path: '/edit',
      builder: (context, GoRouterState state) =>
          TodoEditPage(todo: state.extra as Todo?),
    ),
  );
}

class _TodosModule extends ModuleBase {
  _TodosModule({
    required this.editPage,
  }) : super(
          blocs: [
            BlocProvider<TodoBloc>(
              create: (context) => TodoBloc(
                todosRepository: context.read<TodosRepository>(),
              ),
            ),
          ],
          routes: [editPage],
        );

  /// 'EditPage' Route
  final GoRoute editPage;
}
