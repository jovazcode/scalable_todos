import 'package:bloc/bloc.dart';
import 'package:clean_foundations/clean_foundations.dart';

import 'package:equatable/equatable.dart';

import 'package:todos_domain/todos_domain.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const StatsState()) {
    on<StatsSubscriptionRequested>(_onSubscriptionRequested);
  }

  final TodosRepository _todosRepository;

  Future<void> _onSubscriptionRequested(
    StatsSubscriptionRequested event,
    Emitter<StatsState> emit,
  ) async {
    emit(state.copyWith(status: StatsStatus.loading));

    await emit.forEach<RepositoryResponse<List<Todo>>>(
      _todosRepository.watch(),
      onData: (response) {
        return state.copyWith(
          status: StatsStatus.success,
          completedTodos: (response as RepositorySuccess<List<Todo>>)
              .value
              .where((todo) => todo.isCompleted)
              .length,
          activeTodos: response.value.where((todo) => !todo.isCompleted).length,
        );
      },
      onError: (_, __) => state.copyWith(status: StatsStatus.failure),
    );
  }
}
