import 'package:flutter/material.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// AddTodo Action Button
class AddTodoActionButton extends StatelessWidget {
  /// AddTodo Action Button
  const AddTodoActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: key,
      onPressed: () => context.push(AppRoutes.todos.editPage.path),
      child: const Icon(
        Icons.add,
        size: 38,
      ),
    );
  }
}
