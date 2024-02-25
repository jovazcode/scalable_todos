import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scalable_todos/features/todos/todos.dart';

import 'package:scalable_todos/scalable_todos.dart';

/// [Todo] Submit Button
class TodoSubmitButton extends StatelessWidget {
  /// Submit Button
  const TodoSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textFieldController = context.watch<TextFieldBloc>().state;
    final status = context.select((EditBloc bloc) => bloc.state.status);
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final fabBackgroundColor =
        floatingActionButtonTheme.backgroundColor ?? theme.colorScheme.primary;

    return FloatingActionButton(
      tooltip: l10n.editTodoSaveButtonTooltip,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      backgroundColor:
          status.isLoadingOrSuccess || textFieldController.title.isEmpty
              ? fabBackgroundColor.withOpacity(0.5)
              : fabBackgroundColor,
      onPressed: status.isLoadingOrSuccess || textFieldController.title.isEmpty
          ? null
          : () {
              if (textFieldController.title.isEmpty) {
                return;
              }
              context.read<EditBloc>().add(
                    SubmitEvent(
                      title: textFieldController.title,
                      description: textFieldController.description,
                    ),
                  );
            },
      child: status.isLoadingOrSuccess
          ? const CupertinoActivityIndicator()
          : const Icon(Icons.check_rounded),
    );
  }
}
