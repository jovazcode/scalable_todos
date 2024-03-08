part of 'base.dart';

/// An Entity
///
/// An Entity is an immutable object with an identity that contains
/// attributes.
///
/// Entity instances are created from Maps of data.
///
/// See [https://martinfowler.com/bliki/EvansClassification.html](https://martinfowler.com/bliki/EvansClassification.html)
@immutable
abstract class Entity<EntityId> extends Model {
  /// An Entity
  Entity.fromMap({
    required super.data,
    EntityId? id,
    Identifier<Entity<EntityId>>? identifier,
  })  : internalId = id ??
            (identifier ?? Identifier<Entity<EntityId>>()).generate<EntityId>(),
        _id = id,
        super.fromMap();

  /// Internal entity id
  final EntityId internalId;

  /// Entity id
  EntityId get id => _id ?? internalId;
  final EntityId? _id;

  /// The unique identifier property key of the entity.
  String get idProperty => 'id';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Entity) return false;
    if (runtimeType != other.runtimeType) return false;

    return get<EntityId>(idProperty) == other.get<EntityId>(other.idProperty);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ super.hashData();
}
