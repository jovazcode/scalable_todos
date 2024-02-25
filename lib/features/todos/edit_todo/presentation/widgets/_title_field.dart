part of '../todo_form_view.dart';

/// [Todo] Title Field Edition
class _TitleField extends StatelessWidget {
  /// [Todo] Title Field Edition
  const _TitleField({
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditBloc>().state;
    final hintText = state.initialTodo?.title ?? '';

    return TextFormField(
      key: const Key('editTodoView_title_textFormField'),
      initialValue: state.title,
      decoration: InputDecoration(
        enabled: enabled,
        labelText: l10n.editTodoTitleLabel,
        hintText: hintText,
      ),
      maxLength: 50,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
      ],
      onChanged: (value) {
        context.read<TextFieldBloc>().add(TitleFieldChanged(value));
      },
    );
  }
}
