import 'package:flutter/material.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// List Tile for a [Todo].
class TodoListTile extends StatelessWidget {
  TodoListTile({
    required this.todo,
    required this.leading,
    required this.trailing,
    this.onTap,
  }) : super(
          key: Key('todoListTile_dismissible_${todo.id}'),
        );

  final Todo todo;
  final Widget leading;
  final Widget trailing;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionColor = theme.textTheme.bodySmall?.color;

    return ListTile(
      onTap: onTap,
      title: Text(
        todo.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: captionColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        todo.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
