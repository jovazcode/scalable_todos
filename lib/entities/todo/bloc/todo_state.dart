part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, failure }

final class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    this.todos = const [],
  });

  final TodoStatus status;
  final List<Todo> todos;

  TodoState copyWith({
    TodoStatus Function()? status,
    List<Todo> Function()? todos,
  }) =>
      TodoState(
        status: status != null ? status() : this.status,
        todos: todos != null ? todos() : this.todos,
      );

  @override
  List<Object?> get props => [
        status,
        todos.map((e) => e.toMap),
      ];
}
