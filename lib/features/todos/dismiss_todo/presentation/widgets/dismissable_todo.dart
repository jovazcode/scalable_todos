import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/features/todos/todos.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// Dismissable [Todo]
class DismissableTodo extends StatelessWidget {
  /// Dismissable [Todo]
  const DismissableTodo({
    required this.listTile,
    super.key,
  });

  final TodoListTile listTile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Builder(
      builder: (context) {
        return Dismissible(
          key: Key('todoListTile_dismissible_${listTile.todo.id}'),
          onDismissed: (_) => context.read<DismissBloc>().add(
                DismissedEvent(todo: listTile.todo),
              ),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            color: theme.colorScheme.error,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(
              Icons.delete,
              color: Color(0xAAFFFFFF),
            ),
          ),
          child: listTile,
        );
      },
    );
  }
}
