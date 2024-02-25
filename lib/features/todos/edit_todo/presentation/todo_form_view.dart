import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:scalable_todos/features/todos/edit_todo/edit_todo.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'widgets/_description_field.dart';
part 'widgets/_title_field.dart';

/// [Todo] Form View
class TodoFormView extends StatelessWidget {
  /// [Todo] Edit Scaffold
  const TodoFormView({
    super.key,
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocListener<EditBloc, EditState>(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == EditStatus.success,
          listener: (context, state) => Navigator.of(context).pop(),
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _TitleField(
                      enabled: enabled,
                    ),
                    _DescriptionField(
                      enabled: enabled,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
