// ignore_for_file: unused_element

part of '../stats_view.dart';

/// Stats Infos
class _StatsInfos extends StatelessWidget {
  const _StatsInfos();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<StatsBloc>().state;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          key: const Key('statsView_completedTodos_listTile'),
          leading: const Icon(
            Icons.check_rounded,
            size: 26,
          ),
          title: Text(
            l10n.statsCompletedTodoCountLabel,
            style: textTheme.headlineSmall,
          ),
          trailing: Text(
            '${state.completedTodos}',
            style: textTheme.headlineMedium,
          ),
        ),
        ListTile(
          key: const Key('statsView_activeTodos_listTile'),
          leading: const Icon(
            Icons.radio_button_unchecked_rounded,
            size: 26,
          ),
          title: Text(
            l10n.statsActiveTodoCountLabel,
            style: textTheme.headlineSmall,
          ),
          trailing: Text(
            '${state.activeTodos}',
            style: textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
