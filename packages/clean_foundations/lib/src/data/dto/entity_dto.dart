part of 'dto.dart';

/// An EntityDTO
abstract class EntityDto<EntityId, T extends Entity<EntityId>> extends Dto<T>
    implements Entity<EntityId> {
  /// Constructor
  EntityDto.fromMap({
    required DataMap data,
    EntityId? id,
    this.idProperty = 'id',
    Identifier<Entity<EntityId>>? identifier,
  })  : _internalId = id ??
            data[idProperty] as EntityId? ??
            (identifier ?? Identifier<Entity<EntityId>>()).generate<EntityId>(),
        _id = id ?? data[idProperty] as EntityId?,
        super.fromMap(data);

  /// Internal purpose identifier
  final EntityId _internalId;

  /// Property name of the unique identifier of the entity within its domain
  final String idProperty;

  /// Unique identifier of this class instance
  @override
  EntityId get entityId => _id ?? _internalId;
  final EntityId? _id;

  /// Unique identifier of the entity within its domain
  @override
  EntityId? get id => _id;

  /// Is the Entity newly created (not yet created in its domain)
  @override
  bool get isPhantom => id == null;

  /// Check equality between entities
  @override
  bool equals(Object other) {
    if (identical(this, other)) return true;
    if (other is! Entity) return false;
    if (runtimeType != other.runtimeType) return false;

    return id == other.id;
  }
}
