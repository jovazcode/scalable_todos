// Flutter Base Widgets
import 'package:flutter/widgets.dart';

// App Startup
import 'package:scalable_todos/app/app.dart';

// App Package Base
import 'package:scalable_todos/scalable_todos.dart';

void main() {
  bootstrap(() async {
    // Init dependencies (repositories, storages, apis,...)
    await initDependencies();

    // Run the app
    runApp(const App());
  });
}
