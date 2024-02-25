import 'package:flutter/material.dart';

import 'package:scalable_todos/features/todos/edit_todo/edit_todo.dart';

import 'package:scalable_todos/features/todos/todos.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// [Todo] Edit Scaffold
class TodoEditScaffold extends StatelessWidget {
  const TodoEditScaffold({
    super.key,
    this.todo,
  });

  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isLoadingOrSuccess = context.select(
      (EditBloc bloc) => bloc.state.status.isLoadingOrSuccess,
    );
    final isNewTodo = context.select(
      (EditBloc bloc) => bloc.state.isNewTodo,
    );
    return BlocProvider(
      create: (context) => TextFieldBloc(
        title: todo?.title,
        description: todo?.description,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isNewTodo
                ? l10n.editTodoAddAppBarTitle
                : l10n.editTodoEditAppBarTitle,
          ),
        ),
        floatingActionButton: const TodoSubmitButton(),
        body: TodoFormView(enabled: !isLoadingOrSuccess),
      ),
    );
  }
}
