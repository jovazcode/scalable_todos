import 'package:bloc/bloc.dart';
import 'package:clean_foundations/clean_foundations.dart';

import 'package:equatable/equatable.dart';

import 'package:todos_domain/todos_domain.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc({
    required TodosRepository todosRepository,
    required Todo? initialTodo,
  })  : _todosRepository = todosRepository,
        super(
          EditState(
            initialTodo: initialTodo,
            title: initialTodo?.title ?? '',
            description: initialTodo?.description ?? '',
          ),
        ) {
    on<SubmitEvent>(_onSubmitted);
  }

  final TodosRepository _todosRepository;

  Future<void> _onSubmitted(
    SubmitEvent event,
    Emitter<EditState> emit,
  ) async {
    emit(state.copyWith(status: EditStatus.loading));
    if (state.initialTodo == null) {
      await _onCreate(event, emit);
    } else {
      await _onUpdate(event, emit);
    }
  }

  Future<void> _onCreate(
    SubmitEvent event,
    Emitter<EditState> emit,
  ) async {
    switch (await _todosRepository.create([
      RawData.fromMap(
        data: {
          TodoKey.title.name: event.title,
          TodoKey.description.name: event.description,
        },
      ),
    ])) {
      case RepositorySuccess<ResultSet<Todo>>():
        emit(state.copyWith(status: EditStatus.success));
      case RepositoryFailure<ResultSet<Todo>>():
        emit(state.copyWith(status: EditStatus.failure));
    }
  }

  Future<void> _onUpdate(
    SubmitEvent event,
    Emitter<EditState> emit,
  ) async {
    switch (await _todosRepository.update([
      state.initialTodo!.copyWith({
        TodoKey.title: event.title,
        TodoKey.description: event.description,
      }),
    ])) {
      case RepositorySuccess<ResultSet<Todo>>():
        emit(state.copyWith(status: EditStatus.success));
      case RepositoryFailure<ResultSet<Todo>>():
        emit(state.copyWith(status: EditStatus.failure));
    }
  }
}
