import 'package:clean_foundations/clean_foundations.dart';

/// ResultSet
class ResultSet<T> extends ValueObject {
  /// ResultSet
  ResultSet({
    int? count,
    int? total,
    List<T>? records,
    T? record,
    DateTime? timestamp,
    bool? success,
    String? message,
    String? code,
  }) : this.fromMap({
          'count': count,
          'total': total,
          'records': records,
          'record': record,
          'timestamp': timestamp,
          'success': success,
          'message': message,
          'code': code,
        });

  /// ResultSet
  ResultSet.fromMap(JSONDataMap data)
      : _count = data['count'] as int?,
        _total = data['total'] as int? ?? data['count'] as int?,
        records = data['records'] as List<T>? ?? [],
        _record = data['record'] as T?,
        timestamp = data['timestamp'] as DateTime? ?? DateTime.now(),
        success = data['success'] as bool? ?? true,
        message = data['message'] as String?,
        code = data['code'] as String?,
        super.fromMap(data: data);

  /// Add
  ResultSet<T> add(ResultSet<T> rs) => ResultSet.fromMap({
        ...rs.toMap,
        ...{
          'records': records..addAll(rs.records),
          'count': count + rs.count,
        },
      });

  /// The number of records in this [ResultSet]
  int get count => _count ?? records.length;
  final int? _count;

  /// The total number of records reported by the [DataSource]
  int get total => _total ?? count;
  final int? _total;

  /// List of retrieved record instances
  final List<T> records;

  /// Retrieved record (when 1 only returned)
  T? get record => _record ?? (records.isEmpty ? null : records.first);
  final T? _record;

  /// Operation timestamp
  final DateTime timestamp;

  /// True if the [ResultSet] loaded successfully, false if any
  /// errors were encountered
  final bool success;

  /// The error message that was read in from the [DataSource]
  final String? message;

  /// The error code that was read in from the [DataSource]
  final String? code;
}
