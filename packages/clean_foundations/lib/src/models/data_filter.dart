/// Filter
sealed class DataFilter<T> {
  const DataFilter();

  /// Or Comparaison
  factory DataFilter.or(List<T> filters) => DataFilterOr<T>(filters);

  /// And Comparaison
  factory DataFilter.and(List<T> filters) => DataFilterAnd<T>(filters);

  /// Equal
  factory DataFilter.equal(String key, List<T> values) =>
      DataFilterEqual<T>(key, values);

  /// NotEqual
  factory DataFilter.notEqual(String key, List<T> values) =>
      DataFilterNotEqual<T>(key, values);

  /// LessThan
  factory DataFilter.lessThan(String key, T value) =>
      DataFilterLessThan<T>(key, value);

  /// LessThanEqual
  factory DataFilter.lessThanEqual(String key, T value) =>
      DataFilterLessThanEqual<T>(key, value);

  /// GreaterThan
  factory DataFilter.greaterThan(String key, T value) =>
      DataFilterGreaterThan<T>(key, value);

  /// GreaterThanEqual
  factory DataFilter.greaterThanEqual(String key, T value) =>
      DataFilterGreaterThanEqual<T>(key, value);

  /// StartsWith
  factory DataFilter.startsWith(String key, T value) =>
      DataFilterStartsWith<T>(key, value);

  /// Between
  factory DataFilter.between(String key, T fromValue, T toValue) =>
      DataFilterBetween<T>(key, fromValue, toValue);

  /// Search
  factory DataFilter.search(String key, T value) =>
      DataFilterSearch<T>(key, value);

  /// IsNull
  factory DataFilter.isNull(String key) => DataFilterIsNull<T>(key);

  /// IsNotNull
  factory DataFilter.isNotNull(String key) => DataFilterIsNotNull<T>(key);
}

/// Or
final class DataFilterOr<T> extends DataFilter<T> {
  /// Or Comparaison
  const DataFilterOr(
    this.values,
  );

  /// Values
  final List<T> values;
}

/// And
final class DataFilterAnd<T> extends DataFilter<T> {
  /// And Comparaison
  const DataFilterAnd(
    this.values,
  );

  /// Values
  final List<T> values;
}

/// Equal
final class DataFilterEqual<T> extends DataFilter<T> {
  /// Equal
  const DataFilterEqual(
    this.key,
    this.values,
  );

  /// Key
  final String key;

  /// Values
  final List<T> values;
}

/// NotEqual
final class DataFilterNotEqual<T> extends DataFilter<T> {
  /// NotEqual
  const DataFilterNotEqual(
    this.key,
    this.values,
  );

  /// Key
  final String key;

  /// Values
  final List<T> values;
}

/// LessThan
final class DataFilterLessThan<T> extends DataFilter<T> {
  /// LessThan
  const DataFilterLessThan(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// LessThanEqual
final class DataFilterLessThanEqual<T> extends DataFilter<T> {
  /// LessThanEqual
  const DataFilterLessThanEqual(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// GreaterThan
final class DataFilterGreaterThan<T> extends DataFilter<T> {
  /// GreaterThan
  const DataFilterGreaterThan(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// GreaterThanEqual
final class DataFilterGreaterThanEqual<T> extends DataFilter<T> {
  /// GreaterThanEqual
  const DataFilterGreaterThanEqual(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// StartsWith
final class DataFilterStartsWith<T> extends DataFilter<T> {
  /// StartsWith
  const DataFilterStartsWith(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// EndsWith
final class DataFilterEndsWith<T> extends DataFilter<T> {
  /// EndsWith
  const DataFilterEndsWith(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// Search
final class DataFilterSearch<T> extends DataFilter<T> {
  /// Search
  const DataFilterSearch(
    this.key,
    this.value,
  );

  /// Key
  final String key;

  /// Value
  final T value;
}

/// Between
final class DataFilterBetween<T> extends DataFilter<T> {
  /// Between
  const DataFilterBetween(
    this.key,
    this.value1,
    this.value2,
  );

  /// Key
  final String key;

  /// Value1
  final T value1;

  /// Value2
  final T value2;
}

/// IsNull
final class DataFilterIsNull<T> extends DataFilter<T> {
  /// IsNull
  const DataFilterIsNull(
    this.key,
  );

  /// Key
  final String key;
}

/// IsNotNull
final class DataFilterIsNotNull<T> extends DataFilter<T> {
  /// IsNotNull
  const DataFilterIsNotNull(
    this.key,
  );

  /// Key
  final String key;
}
