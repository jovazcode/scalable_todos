part of 'main_page.dart';

/// Main Scaffold
class MainScaffold extends StatelessWidget {
  const MainScaffold({
    required this.body,
    required this.actionButton,
    required this.bottomAppBar,
    super.key,
  });

  final Widget body;
  final Widget actionButton;
  final Widget bottomAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: actionButton,
      bottomNavigationBar: bottomAppBar,
    );
  }
}
