part of 'base.dart';

/// A Value Object.
///
/// A Value Object is a [Model] that contains attributes and has
/// no conceptual identity.
///
/// Value Objects are internally [RawData]s that can be created from [DataMap]s.
///
/// See [https://martinfowler.com/bliki/EvansClassification.html](https://martinfowler.com/bliki/EvansClassification.html)
@immutable
class ValueObject extends RawData implements Model {
  /// A Value Object
  const ValueObject.fromMap({required super.data}) : super.fromMap();
}
