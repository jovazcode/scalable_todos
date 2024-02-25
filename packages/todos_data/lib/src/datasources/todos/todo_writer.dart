import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_data/src/models/models.dart';

/// Entity Writer
class TodoJsonDataWriter extends DataWriter<TodoEntity> {
  @override
  dynamic write(TodoEntity record) => record.toMap;
}
