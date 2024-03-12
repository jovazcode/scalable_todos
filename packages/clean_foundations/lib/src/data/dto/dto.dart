import 'package:clean_foundations/clean_foundations.dart';

part 'entity_dto.dart';

/// A DTO
abstract class Dto<M extends Model> extends RawData {
  /// DTO from a [DataMap]
  const Dto.fromMap(DataMap data) : super.fromMap(data: data);

  /// To Domain ([Model])
  M toDomain();
}
