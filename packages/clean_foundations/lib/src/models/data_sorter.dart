/// Sorter
sealed class DataSorter<T> {
  const DataSorter();

  /// OrderDesc
  factory DataSorter.orderDesc(String key) => DataSorterOrderDesc<T>(key);

  /// OrderAsc
  factory DataSorter.orderAsc(String key) => DataSorterOrderAsc<T>(key);
}

/// No Value Sorter
final class _DataNoValueSorter<T> extends DataSorter<T> {
  /// No Value Sorter
  const _DataNoValueSorter(
    this.key,
  );

  /// Key
  final String key;
}

/// OrderDesc
final class DataSorterOrderDesc<T> extends _DataNoValueSorter<T> {
  /// OrderDesc
  const DataSorterOrderDesc(super.key);
}

/// OrderAsc
final class DataSorterOrderAsc<T> extends _DataNoValueSorter<T> {
  /// OrderAsc
  const DataSorterOrderAsc(super.key);
}
