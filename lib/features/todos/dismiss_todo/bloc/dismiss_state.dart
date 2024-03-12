part of 'dismiss_bloc.dart';

enum DismissStatus { initial, loading, success, failure }

final class DismissState extends Equatable {
  const DismissState({
    this.status = DismissStatus.initial,
    this.lastDismissedTodo,
  });

  final DismissStatus status;
  final Todo? lastDismissedTodo;

  DismissState copyWith({
    DismissStatus Function()? status,
    Todo? Function()? lastDismissedTodo,
  }) =>
      DismissState(
        status: status != null ? status() : this.status,
        lastDismissedTodo: lastDismissedTodo != null
            ? lastDismissedTodo()
            : this.lastDismissedTodo,
      );

  @override
  List<Object?> get props => [
        status,
        lastDismissedTodo ?? {},
      ];
}
