import 'package:uuid/uuid.dart';

Type _typeOf<X>() => X;

class _ObjectWithId<ObjectWithIdType> {
  const _ObjectWithId._();

  static _ObjectWithId<ObjectWithIdType> getInstance<ObjectWithIdType>() =>
      (_instance ??= _ObjectWithId<ObjectWithIdType>._())
          as _ObjectWithId<ObjectWithIdType>;

  static _ObjectWithId<dynamic>? _instance;
}

/// Identifier
class Identifier<ObjectWithIdType> {
  /// Identifier
  Identifier() : _idCounters = const {};

  final Map<_ObjectWithId<ObjectWithIdType>, int> _idCounters;

  /// Generate a new id.
  T generate<T>() {
    if (_typeOf<T>() != String && _typeOf<T>() != int) {
      throw ArgumentError.value(
        T,
        'Identifier',
        'Type must be either int or String. ($T)',
      );
    }
    if (T is int) {
      final obj = _ObjectWithId.getInstance<ObjectWithIdType>();
      if (!_idCounters.containsKey(obj)) {
        _idCounters[obj] = 0;
      }
      _idCounters[obj] = _idCounters[obj]! + 1;
      return _idCounters[obj] as T;
    }
    return const Uuid().v4() as T;
  }
}
