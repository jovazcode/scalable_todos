import 'package:clean_foundations/clean_foundations.dart';

import 'package:meta/meta.dart';

part 'entity.dart';
part 'value_object.dart';

/// A [Model] is a representation of a business object.
///
/// [Model] is an internal immutable class made of [RawData], which `records`
/// instances are created from Maps of data.
@immutable
abstract class Model extends RawData {
  /// A Model is a representation of a business object.
  const Model.fromMap({required super.data}) : super.fromMap();
}
