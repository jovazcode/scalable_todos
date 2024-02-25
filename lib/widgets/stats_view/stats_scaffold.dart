// ignore_for_file: library_private_types_in_public_api

part of 'stats_view.dart';

/// Stats Scaffold
class StatsScaffold extends StatelessWidget {
  const StatsScaffold({
    required this.appBar,
    required this.statsInfos,
    super.key,
  });

  final AppBar appBar;
  final _StatsInfos statsInfos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: statsInfos,
    );
  }
}
