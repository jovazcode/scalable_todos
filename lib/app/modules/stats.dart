// ignore_for_file: library_private_types_in_public_api

import 'package:scalable_todos/app/modules/modules.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// "Stats" Module.
class StatsModule {
  static final _StatsModule module = _StatsModule();
}

class _StatsModule extends ModuleBase {
  _StatsModule()
      : super(
          blocs: [
            BlocProvider<StatsBloc>(
              create: (context) => StatsBloc(
                todosRepository: context.read<TodosRepository>(),
              ),
            ),
          ],
        );
}
