import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/scalable_todos.dart';

enum TodosOverviewOption { toggleAll, clearCompleted }

/// Options Button
class TodosOptionsButton extends StatelessWidget {
  /// Options Button
  const TodosOptionsButton({
    required this.todos,
    super.key,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final hasTodos = todos.isNotEmpty;
    final completedTodosAmount = todos.where((todo) => todo.isCompleted).length;

    return Builder(
      builder: (context) {
        return PopupMenuButton<TodosOverviewOption>(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          tooltip: l10n.todosOverviewOptionsTooltip,
          onSelected: (options) {
            switch (options) {
              case TodosOverviewOption.toggleAll:
                context.read<TodoBloc>().add(
                      TodoToggleAllRequested(
                        completed: completedTodosAmount != todos.length,
                      ),
                    );
              case TodosOverviewOption.clearCompleted:
                context.read<TodoBloc>().add(
                      const TodoClearCompletedRequested(),
                    );
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: TodosOverviewOption.toggleAll,
                enabled: hasTodos,
                child: Text(
                  completedTodosAmount == todos.length
                      ? l10n.todosOverviewOptionsMarkAllIncomplete
                      : l10n.todosOverviewOptionsMarkAllComplete,
                ),
              ),
              PopupMenuItem(
                value: TodosOverviewOption.clearCompleted,
                enabled: hasTodos && completedTodosAmount > 0,
                child: Text(l10n.todosOverviewOptionsClearCompleted),
              ),
            ];
          },
          icon: const Icon(
            Icons.more_vert_rounded,
            size: 32,
          ),
        );
      },
    );
  }
}
