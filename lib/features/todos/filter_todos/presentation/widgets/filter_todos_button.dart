import 'package:flutter/material.dart';
import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// FilterTodosButton
class FilterTodosButton extends StatelessWidget {
  /// FilterTodosButton
  const FilterTodosButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final l10n = context.l10n;

        final activeFilter = context.select<TodoBloc, TodosFilter>(
          (TodoBloc cubit) => cubit.state.filter,
        );

        return PopupMenuButton<TodosFilter>(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          initialValue: activeFilter,
          tooltip: l10n.todosOverviewFilterTooltip,
          onSelected: (filter) {
            context.read<TodoBloc>().add(
                  TodoSubscriptionRequested(filter: filter),
                );
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: TodosFilter.all,
                child: Text(l10n.todosOverviewFilterAll),
              ),
              PopupMenuItem(
                value: TodosFilter.activeOnly,
                child: Text(l10n.todosOverviewFilterActiveOnly),
              ),
              PopupMenuItem(
                value: TodosFilter.completedOnly,
                child: Text(l10n.todosOverviewFilterCompletedOnly),
              ),
            ];
          },
          icon: const Icon(
            Icons.filter_list_rounded,
            size: 32,
          ),
        );
      },
    );
  }
}
