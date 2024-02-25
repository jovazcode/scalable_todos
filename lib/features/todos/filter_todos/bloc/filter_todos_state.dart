part of 'filter_todos_cubit.dart';

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

final class FilterTodosState extends Equatable {
  const FilterTodosState({
    this.filter = TodosFilter.all,
  });

  final TodosFilter filter;

  @override
  List<Object> get props => [filter];
}
