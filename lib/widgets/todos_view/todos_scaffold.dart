// ignore_for_file: library_private_types_in_public_api

part of 'todos_view.dart';

/// [Todo]s Scaffold
class TodosScaffold extends StatelessWidget {
  const TodosScaffold({
    required this.appBar,
    required this.listView,
    super.key,
  });

  final _AppBar appBar;
  final _ListView listView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
