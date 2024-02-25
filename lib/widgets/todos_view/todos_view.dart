import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/features/features.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'todos_scaffold.dart';
part 'widgets/_app_bar.dart';
part 'widgets/_list_view.dart';

/// [Todo]s View
class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  @override
  void initState() {
    context.read<TodoBloc>().add(const TodoSubscriptionRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider<DismissBloc>(
      create: (context) => DismissBloc(
        todosRepository: context.read<TodosRepository>(),
      ),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return TodosScaffold(
            appBar: _AppBar(l10n: l10n, todos: state.todos),
            listView: _ListView(l10n: l10n),
          );
        },
      ),
    );
  }
}
