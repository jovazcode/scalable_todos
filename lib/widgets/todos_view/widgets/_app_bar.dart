part of '../todos_view.dart';

/// App Bar
class _AppBar extends AppBar {
  _AppBar({
    required AppLocalizations l10n,
    required List<Todo> todos,
  }) : super(
          title: Text(l10n.todosOverviewAppBarTitle),
          actions: [
            const FilterTodosButton(),
            TodosOptionsButton(todos: todos),
          ],
        );
}
