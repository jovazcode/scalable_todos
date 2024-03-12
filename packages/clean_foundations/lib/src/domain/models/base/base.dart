import 'package:clean_foundations/clean_foundations.dart';

import 'package:meta/meta.dart';

part 'entity.dart';
part 'value_object.dart';

/// A [Model] is a representation of a business object.
///
/// [Model] is an internal immutable class.
@immutable
abstract class Model {}
