part of '../main_page.dart';

/// Bottom AppBar
class _BottomAppBarWidget extends StatelessWidget {
  const _BottomAppBarWidget({
    required this.selectedTab,
  });

  final MainTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _HomeTabButton(
            groupValue: selectedTab,
            value: MainTab.todos,
            icon: const Icon(Icons.list_rounded),
          ),
          _HomeTabButton(
            groupValue: selectedTab,
            value: MainTab.stats,
            icon: const Icon(Icons.show_chart_rounded),
          ),
        ],
      ),
    );
  }
}

class _HomeTabButton extends StatelessWidget {
  const _HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final MainTab groupValue;
  final MainTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<MainCubit>().setTab(value),
      iconSize: 38,
      color: groupValue != value
          ? Theme.of(context).colorScheme.secondary.withOpacity(0.2)
          : Theme.of(context).colorScheme.secondary,
      icon: icon,
    );
  }
}
