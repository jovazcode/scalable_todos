import 'package:clean_foundations/clean_foundations.dart';
import 'package:equatable/equatable.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'filter_todos_state.dart';

class FilterTodosCubit extends Cubit<FilterTodosState> {
  FilterTodosCubit({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const FilterTodosState());

  final TodosRepository _todosRepository;

  Future<void> filterTodos(TodosFilter filter) async {
    final filters = <DataFilter<dynamic>>[];
    if (filter != TodosFilter.all) {
      filters.add(
        DataFilter.equal(
          'completed',
          [filter == TodosFilter.completedOnly],
        ),
      );
    }
    await _todosRepository.filter(filters: filters);
    emit(FilterTodosState(filter: filter));
  }
}
