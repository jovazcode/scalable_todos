import 'package:flutter/material.dart';

import 'package:scalable_todos/features/todos/edit_todo/edit_todo.dart';

import 'package:scalable_todos/pages/todo_edit_page/todo_edit_scaffold.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// [Todo] Edit Page.
class TodoEditPage extends StatelessWidget {
  const TodoEditPage({
    super.key,
    this.todo,
  });

  final Todo? todo;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => EditBloc(
          todosRepository: context.read<TodosRepository>(),
          initialTodo: todo,
        ),
        child: TodoEditScaffold(todo: todo),
      );
}
