part of 'edit_bloc.dart';

enum EditStatus { initial, loading, success, failure }

extension EditStatusX on EditStatus {
  bool get isLoadingOrSuccess => [
        EditStatus.loading,
        EditStatus.success,
      ].contains(this);
}

final class EditState extends Equatable {
  const EditState({
    this.status = EditStatus.initial,
    this.initialTodo,
    this.title = '',
    this.description = '',
  });

  final EditStatus status;
  final Todo? initialTodo;
  final String title;
  final String description;

  bool get isNewTodo => initialTodo == null;

  EditState copyWith({
    EditStatus? status,
    Todo? initialTodo,
    String? title,
    String? description,
  }) {
    return EditState(
      status: status ?? this.status,
      initialTodo: initialTodo ?? this.initialTodo,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [status, initialTodo];
}
