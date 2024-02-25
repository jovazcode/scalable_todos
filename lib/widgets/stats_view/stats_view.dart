import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'stats_scaffold.dart';
part 'widgets/_stats_infos.dart';

/// [Stats] View
class StatsView extends StatefulWidget {
  const StatsView({super.key});

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  void initState() {
    context.read<StatsBloc>().add(const StatsSubscriptionRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<StatsBloc, StatsState>(
      builder: (context, state) {
        return StatsScaffold(
          appBar: AppBar(title: Text(l10n.statsAppBarTitle)),
          statsInfos: const _StatsInfos(),
        );
      },
    );
  }
}
