part of '../main_page.dart';

/// Main Body
class _MainBodyWidget extends StatelessWidget {
  const _MainBodyWidget({
    required this.selectedTab,
    required this.tabs,
  });

  final MainTab selectedTab;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedTab.index,
      children: tabs,
    );
  }
}
