part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

final class TodoSubscriptionRequested extends TodoEvent {
  const TodoSubscriptionRequested();
}

class TodoSetCompletedRequested extends TodoEvent {
  const TodoSetCompletedRequested({
    required this.todo,
    required this.value,
  });

  final Todo todo;
  final bool value;
}

class TodoToggleAllRequested extends TodoEvent {
  const TodoToggleAllRequested({required this.completed});

  final bool completed;
}

class TodoClearCompletedRequested extends TodoEvent {
  const TodoClearCompletedRequested();
}
