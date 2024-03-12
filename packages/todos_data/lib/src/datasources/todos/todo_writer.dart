import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_data/src/dto/dto.dart';

/// DTO Writer
class TodoDTOWriter extends DataWriter<TodoDTO> {
  @override
  dynamic write(TodoDTO record) => record.toMap;
}
