import 'package:flutter/material.dart';

import 'package:scalable_todos/entities/entities.dart';

import 'package:scalable_todos/features/features.dart';

import 'package:scalable_todos/pages/main_page/controller/main_cubit.dart';

import 'package:scalable_todos/scalable_todos.dart';

import 'package:scalable_todos/widgets/widgets.dart';

part 'main_scaffold.dart';

part 'widgets/_bottom_appbar.dart';
part 'widgets/_main_body.dart';

/// The Main Page.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<TodoBloc, TodoState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == TodoStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(l10n.todosOverviewErrorSnackbarText),
              ),
            );
        }
      },
      child: BlocProvider(
        create: (_) => MainCubit(),
        child: Builder(
          builder: (context) {
            final tab = context.select((MainCubit cubit) => cubit.state.tab);
            return MainScaffold(
              body: _MainBodyWidget(
                selectedTab: tab,
                tabs: const [TodosView(), StatsView()],
              ),
              actionButton: const AddTodoActionButton(),
              bottomAppBar: _BottomAppBarWidget(selectedTab: tab),
            );
          },
        ),
      ),
    );
  }
}
