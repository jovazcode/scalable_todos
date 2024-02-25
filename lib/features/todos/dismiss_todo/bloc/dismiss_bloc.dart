import 'package:clean_foundations/clean_foundations.dart';
import 'package:equatable/equatable.dart';

import 'package:scalable_todos/scalable_todos.dart';

part 'dismiss_event.dart';
part 'dismiss_state.dart';

class DismissBloc extends Bloc<DismissEvent, DismissState> {
  DismissBloc({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const DismissState()) {
    on<DismissedEvent>(_onDismissed);
    on<UndismissedEvent>(_onUndismissed);
  }

  final TodosRepository _todosRepository;

  Future<void> _onDismissed(
    DismissedEvent event,
    Emitter<DismissState> emit,
  ) async {
    emit(state.copyWith(lastDismissedTodo: () => event.todo));
    await _todosRepository.delete([event.todo]);
  }

  Future<void> _onUndismissed(
    UndismissedEvent event,
    Emitter<DismissState> emit,
  ) async {
    emit(state.copyWith(lastDismissedTodo: () => event.todo));
    await _todosRepository.create([
      RawData.fromMap(
        data: {
          TodoKey.title.name: event.todo.title,
          TodoKey.description.name: event.todo.description,
          TodoKey.completed.name: event.todo.isCompleted,
        },
      ),
    ]);
  }
}
