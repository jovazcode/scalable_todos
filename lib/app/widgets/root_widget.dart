import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scalable_todos/app/modules/modules.dart';

/// App Root Widget
class AppRootWidget extends StatelessWidget {
  const AppRootWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      _buildWithAppRepos(_buildWithAppBlocs(child));

  Widget _buildWithAppRepos(Widget child) => AppModules.repos.isEmpty
      ? child
      : MultiRepositoryProvider(
          providers: AppModules.repos,
          child: child,
        );
  Widget _buildWithAppBlocs(Widget child) => AppModules.blocs.isEmpty
      ? child
      : MultiBlocProvider(
          providers: AppModules.blocs,
          child: child,
        );
}
