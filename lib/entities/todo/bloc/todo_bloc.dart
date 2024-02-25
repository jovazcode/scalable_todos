import 'package:clean_foundations/clean_foundations.dart';
import 'package:equatable/equatable.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const TodoState()) {
    on<TodoSubscriptionRequested>(_onSubscriptionRequested);
    on<TodoSetCompletedRequested>(_onSetCompletedRequested);
    on<TodoToggleAllRequested>(_onToggleAllRequested);
    on<TodoClearCompletedRequested>(_onClearCompletedRequested);
  }

  final TodosRepository _todosRepository;

  Future<void> _onSubscriptionRequested(
    TodoSubscriptionRequested event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: () => TodoStatus.loading));

    await emit.forEach<RepositoryResponse<List<Todo>>>(
      _todosRepository.watch(),
      onData: (response) => state.copyWith(
        status: () => TodoStatus.success,
        todos: () => (response as RepositorySuccess<List<Todo>>).value,
      ),
      onError: (_, __) => state.copyWith(
        status: () => TodoStatus.failure,
      ),
    );
  }

  Future<void> _onSetCompletedRequested(
    TodoSetCompletedRequested event,
    Emitter<TodoState> emit,
  ) async {
    await _todosRepository.update([
      event.todo.copyWith({TodoKey.completed: event.value}),
    ]);
  }

  Future<void> _onToggleAllRequested(
    TodoToggleAllRequested event,
    Emitter<TodoState> emit,
  ) async {
    await _todosRepository.setAllCompleted(value: event.completed);
  }

  Future<void> _onClearCompletedRequested(
    TodoClearCompletedRequested event,
    Emitter<TodoState> emit,
  ) async {
    await _todosRepository.clearCompleted();
  }
}
