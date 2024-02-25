import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter/widgets.dart';

/// A [BlocObserver] which observes all bloc and cubit instances.
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Bootstraps the application.
void bootstrap(Future<void> Function() runApp) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Set Bloc observer
      Bloc.observer = const AppBlocObserver();

      // Run the app
      await runApp();
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
