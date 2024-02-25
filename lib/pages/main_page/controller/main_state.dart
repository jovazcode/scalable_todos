part of 'main_cubit.dart';

enum MainTab { todos, stats }

final class MainState extends Equatable {
  const MainState({
    this.tab = MainTab.todos,
  });

  final MainTab tab;

  @override
  List<Object> get props => [tab];
}
