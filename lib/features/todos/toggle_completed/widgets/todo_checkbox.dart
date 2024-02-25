import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// [Todo] Checkbox
class TodoCheckbox extends StatelessWidget {
  /// [Todo] Checkbox
  const TodoCheckbox({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        value: todo.isCompleted,
        onChanged: (value) => context.read<TodoBloc>().add(
              TodoSetCompletedRequested(
                todo: todo,
                value: value!,
              ),
            ),
        // visualDensity: VisualDensity(horizontal: 4.0, vertical: 4.0),
      ),
    );
  }
}
