import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_domain/todos_domain.dart';

/// A StatsDTO
class StatsDTO extends Dto<Stats> {
  const StatsDTO.fromMap(super.data) : super.fromMap();

  StatsDTO.fromDomain(Stats model)
      : super.fromMap({
          'completedTodos': model.completedTodos,
          'activeTodos': model.activeTodos,
        });

  int get completedTodos => get<int>('completedTodos') ?? 0;
  int get activeTodos => get<int>('activeTodos') ?? 0;

  @override
  Stats toDomain() => Stats(
        completedTodos: completedTodos,
        activeTodos: activeTodos,
      );
}
