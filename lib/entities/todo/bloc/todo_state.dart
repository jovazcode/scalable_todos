part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, failure }

enum TodosFilter { all, activeOnly, completedOnly }

extension TodosFilterX on TodosFilter {
  bool apply(Todo todo) {
    switch (this) {
      case TodosFilter.all:
        return true;
      case TodosFilter.activeOnly:
        return !todo.isCompleted;
      case TodosFilter.completedOnly:
        return todo.isCompleted;
    }
  }

  Iterable<Todo> applyAll(Iterable<Todo> todos) {
    return todos.where(apply);
  }
}

final class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    this.filter = TodosFilter.all,
    this.todos = const [],
  });

  final TodoStatus status;
  final TodosFilter filter;
  final List<Todo> todos;

  TodoState copyWith({
    TodoStatus Function()? status,
    TodosFilter Function()? filter,
    List<Todo> Function()? todos,
  }) =>
      TodoState(
        status: status != null ? status() : this.status,
        filter: filter != null ? filter() : this.filter,
        todos: todos != null ? todos() : this.todos,
      );

  @override
  List<Object?> get props => [
        status,
        filter,
        todos,
      ];
}
