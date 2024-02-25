import 'package:flutter/material.dart';

import 'package:scalable_todos/app/widgets/widgets.dart';

import 'package:scalable_todos/scalable_todos.dart';

export 'lib/lib.dart' show initDependencies;

/// The app.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // AppRes.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Material App
    return AppRootWidget(
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: AppRoutes.routerConfig,
      ),
    );
  }
}
