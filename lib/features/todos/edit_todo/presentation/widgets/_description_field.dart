part of '../todo_form_view.dart';

/// [Todo] Description Field Edition
class _DescriptionField extends StatelessWidget {
  /// [Todo] Description Field Edition
  const _DescriptionField({
    this.enabled = true,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final state = context.watch<EditBloc>().state;
    final hintText = state.initialTodo?.description ?? '';

    return TextFormField(
      key: const Key('editTodoView_description_textFormField'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: enabled,
        labelText: l10n.editTodoDescriptionLabel,
        hintText: hintText,
      ),
      maxLength: 300,
      maxLines: 7,
      inputFormatters: [
        LengthLimitingTextInputFormatter(300),
      ],
      onChanged: (value) {
        context.read<TextFieldBloc>().add(DescriptionFieldChanged(value));
      },
    );
  }
}
