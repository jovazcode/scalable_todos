// ignore_for_file: parameter_assignments

import 'package:clean_foundations/clean_foundations.dart';

import 'package:collection/collection.dart';

import 'package:meta/meta.dart';

const DeepCollectionEquality _equality = DeepCollectionEquality();

/// Raw Internal Data
@immutable
class RawData {
  /// A Raw DataMap Object from Map
  const RawData.fromMap({
    required DataMap data,
  }) : _data = data;

  /// A Raw DataMap Object from Json (needed for Json Serialization)
  const RawData.fromJson({
    required DataMap data,
  }) : _data = data;

  /// Internal raw data
  final DataMap _data;

  /// Returns data as a map.
  DataMap get toMap => {}..addAll(_data);

  /// Returns data as json map (needed for Json Serialization)
  DataMap toJson() => toMap;

  /// Get value
  T? get<T>(String key) => _data[key] as T?;

  /// Returns a copy of this Raw DataMap with the given values updated.
  RawData mergeWith(DataMap dataMap) => RawData.fromMap(
        data: {}
          ..addAll(_data)
          ..addAll(dataMap),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RawData) return false;
    if (runtimeType != other.runtimeType) return false;

    return _equals(_data, other._data);
  }

  bool _equals(DataMap? data1, DataMap? data2) {
    final list1 = data1?.entries.toList();
    final list2 = data2?.entries.toList();
    if (identical(list1, list2)) return true;
    if (list1 == null || list2 == null) return false;
    final length = list1.length;
    if (length != list2.length) return false;

    for (var i = 0; i < length; i++) {
      final unit1 = list1[i];
      final unit2 = list2[i];

      if (_isDataMap(unit1) && _isDataMap(unit2)) {
        if (unit1 != unit2) return false;
      } else if (unit1 is Iterable || unit1 is Map) {
        if (!_equality.equals(unit1, unit2)) return false;
      } else if (unit1.runtimeType != unit2.runtimeType) {
        return false;
      } else if (unit1 != unit2) {
        return false;
      }
    }
    return true;
  }

  bool _isDataMap(Object? object) {
    return object is RawData;
  }

  @override
  int get hashCode => runtimeType.hashCode ^ hashData();

  /// Hash internal data
  int hashData() => _mapDataToHashCode(_data.values.fold(0, _combine));

  /// Jenkins Hash Functions
  /// https://en.wikipedia.org/wiki/Jenkins_hash_function
  int _combine(int hash, dynamic object) {
    if (object is Map) {
      for (final key in object.keys) {
        hash = hash ^ _combine(hash, <dynamic>[key, object[key]]);
      }
      return hash;
    }
    if (object is Iterable) {
      for (final value in object) {
        hash = hash ^ _combine(hash, value);
      }
      return hash ^ object.length;
    }

    hash = 0x1fffffff & (hash + object.hashCode);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  int _mapDataToHashCode(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }

  @override
  String toString() => _data.toString();

  /// Match filter
  bool matchFilter(DataFilter<dynamic> filter) => switch (filter) {
        DataFilterOr() =>
          filter.values.any((value) => matchFilter(value as DataFilter)),
        DataFilterAnd() =>
          !filter.values.any((value) => !matchFilter(value as DataFilter)),
        DataFilterEqual() => _matchEqual(filter),
        DataFilterNotEqual() => _matchNotEqual(filter),
        DataFilterLessThan<dynamic>() =>
          get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value) < 0,
        DataFilterLessThanEqual<dynamic>() =>
          get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value) <= 0,
        DataFilterGreaterThan<dynamic>() =>
          get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value) > 0,
        DataFilterGreaterThanEqual<dynamic>() =>
          get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value) >= 0,
        DataFilterStartsWith() => get<String>(filter.key)?.startsWith(
              filter.value as String,
            ) ??
            false,
        DataFilterEndsWith() => get<String>(filter.key)?.endsWith(
              filter.value as String,
            ) ??
            false,
        DataFilterSearch() => get<String>(filter.key)?.toLowerCase().contains(
                  (filter.value as String).toLowerCase(),
                ) ??
            false,
        DataFilterBetween<dynamic>() =>
          get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value1) <= 0 &&
              get<Comparable<dynamic>>(filter.key)!.compareTo(filter.value2) >=
                  0,
        DataFilterIsNull<dynamic>() => get<dynamic>(filter.key) == null,
        DataFilterIsNotNull<dynamic>() => get<dynamic>(filter.key) != null,
      };

  bool _matchEqual(DataFilterEqual<dynamic> filter) {
    final value = get<dynamic>(filter.key);
    if (value == null) {
      if (filter.values.contains(false) || filter.values.contains('')) {
        return true;
      }
    }
    return filter.values.contains(value);
  }

  bool _matchNotEqual(DataFilterNotEqual<dynamic> filter) {
    final value = get<dynamic>(filter.key);
    if (value == null) {
      if (filter.values.contains(false) || filter.values.contains('')) {
        return false;
      }
    }
    return !filter.values.contains(value);
  }
}
