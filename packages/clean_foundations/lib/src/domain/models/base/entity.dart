part of 'base.dart';

/// An Entity
///
/// An Entity is a [Model] with an identity.
///
/// See [https://martinfowler.com/bliki/EvansClassification.html](https://martinfowler.com/bliki/EvansClassification.html)
@immutable
abstract class Entity<EntityId> implements Model {
  /// Constructor
  Entity({
    EntityId? id,
    Identifier<Entity<EntityId>>? identifier,
  })  : _internalId = id ??
            (identifier ?? Identifier<Entity<EntityId>>()).generate<EntityId>(),
        _id = id;

  /// Internal purpose identifier
  final EntityId _internalId;

  /// Unique identifier of this class instance
  EntityId get entityId => _id ?? _internalId;
  final EntityId? _id;

  /// Unique identifier of the entity within its domain
  EntityId? get id => _id;

  /// Is the Entity newly created (not yet created in its domain)
  bool get isPhantom => id == null;

  /// Check equality between entities
  bool equals(Object other) {
    if (identical(this, other)) return true;
    if (other is! Entity) return false;
    if (runtimeType != other.runtimeType) return false;

    return id == other.id;
  }
}
