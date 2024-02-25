part of 'base.dart';

/// A Value Object.
///
/// A Value Object is an immutable object that contains attributes and has
/// no conceptual identity.
///
/// Value Objects instances are created from Maps of data.
///
/// See [https://martinfowler.com/bliki/EvansClassification.html](https://martinfowler.com/bliki/EvansClassification.html)
@immutable
class ValueObject extends Model {
  /// A Value Object
  const ValueObject.fromMap({required super.data}) : super.fromMap();
}
