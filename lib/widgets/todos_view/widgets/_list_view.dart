part of '../todos_view.dart';

/// List View
class _ListView extends StatelessWidget {
  const _ListView({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final status = context.select((TodoBloc bloc) => bloc.state.status);
    final todos = context.select((TodoBloc bloc) => bloc.state.todos);

    if (todos.isEmpty) {
      if (status == TodoStatus.loading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (status != TodoStatus.success) {
        return const SizedBox();
      } else {
        return Center(
          child: Text(
            l10n.todosOverviewEmptyText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      }
    }

    return BlocListener<DismissBloc, DismissState>(
      listenWhen: (previous, current) =>
          previous.lastDismissedTodo != current.lastDismissedTodo &&
          current.lastDismissedTodo != null,
      listener: (context, state) {
        final deletedTodo = state.lastDismissedTodo!;
        final messenger = ScaffoldMessenger.of(context);
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                l10n.todosOverviewTodoDeletedSnackbarText(
                  deletedTodo.title,
                ),
              ),
              action: SnackBarAction(
                label: l10n.todosOverviewUndoDeletionButtonText,

                // ignore: unnecessary_lambdas
                onPressed: () {
                  messenger.hideCurrentSnackBar();
                  context.read<DismissBloc>().add(
                        UndismissedEvent(
                          todo: state.lastDismissedTodo!,
                        ),
                      );
                },
              ),
            ),
          );
      },
      child: CupertinoScrollbar(
        child: ListView(
          children: [
            for (final todo in todos)
              DismissableTodo(
                listTile: TodoListTile(
                  todo: todo,
                  leading: TodoCheckbox(todo: todo),
                  trailing: const SizedBox.shrink(),
                  onTap: () {
                    context.push(
                      AppRoutes.todos.editPage.path,
                      extra: todo,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
