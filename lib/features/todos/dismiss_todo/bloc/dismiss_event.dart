part of 'dismiss_bloc.dart';

sealed class DismissEvent extends Equatable {
  const DismissEvent();

  @override
  List<Object> get props => [];
}

final class DismissedEvent extends DismissEvent {
  const DismissedEvent({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

final class UndismissedEvent extends DismissEvent {
  const UndismissedEvent({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}
