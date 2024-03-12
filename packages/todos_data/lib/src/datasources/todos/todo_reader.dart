import 'package:clean_foundations/clean_foundations.dart';

import 'package:todos_data/src/dto/dto.dart';

/// DTO Reader
class TodoDTOReader extends DataReader<TodoDTO> {
  @override
  TodoDTO read(dynamic data) {
    if (data is! Map<String, dynamic>) {
      throw DataException(
        message:
            // ignore: lines_longer_than_80_chars
            'Invalid data format, ${data.runtimeType} (expected a Map<String, dynamic>)',
      );
    }
    try {
      return TodoDTO.fromMap(data);
    } on Exception catch (e) {
      throw DataException(exception: e);
    }
  }
}
