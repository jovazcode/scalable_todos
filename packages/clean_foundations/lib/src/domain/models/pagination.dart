import 'package:clean_foundations/clean_foundations.dart';

/// Pagination
sealed class Pagination {
  const Pagination();

  /// From Map
  factory Pagination.fromMap(DataMap data) {
    return PagePagination._readPageSize(data, 'limit') != null
        ? Pagination._page(data)
        : Pagination._cursor();
  }

  /// Page-based pagination
  factory Pagination._page(DataMap data) => PagePagination(data);

  /// Cursor-based pagination
  factory Pagination._cursor() => const CursorPagination();

  /// Previous page
  Pagination previousPage();

  /// Next page
  Pagination nextPage();
}

/// PagePagination
final class PagePagination extends Pagination {
  /// PagePagination
  PagePagination(DataMap data)
      : _start = _readStartIndex(data, 'start'),
        limit = _readPageSize(data, 'limit') ?? 25,
        _page = _readCurrentPage(data, 'page');

  static int? _readStartIndex(DataMap json, String key) {
    final expectedKey = ['start_index', 'position', 'offset'].firstWhere(
      (element) => json.containsKey(element),
      orElse: () => key,
    );
    return int.tryParse(json[expectedKey] as String);
  }

  static int? _readCurrentPage(DataMap json, String key) {
    final expectedKey = ['current_page', 'currentPage'].firstWhere(
      (element) => json.containsKey(element),
      orElse: () => key,
    );
    return int.tryParse(json[expectedKey] as String);
  }

  static int? _readPageSize(DataMap json, String key) {
    final expectedKey = ['page_size', 'per_page', 'max'].firstWhere(
      (element) => json.containsKey(element),
      orElse: () => key,
    );
    return int.tryParse(json[expectedKey] as String? ?? '');
  }

  /// Fetch records starting from [start] value index
  int get start => _start ?? page * limit;
  final int? _start;

  /// Fetch max [limit] records
  final int limit;

  /// When paginating, indicates the page number to be retrieved
  int get page => _page ?? 0;
  final int? _page;

  /// Previous page
  @override
  Pagination previousPage() => PagePagination({
        'start': start - (page - 1) * limit,
        'limit': limit,
        'page': page - 1,
      });

  /// Next page
  @override
  Pagination nextPage() => PagePagination({
        'start': start - (page + 1) * limit,
        'limit': limit,
        'page': page + 1,
      });
}

/// CursorPagination
final class CursorPagination extends Pagination {
  /// CursorPagination
  const CursorPagination();

  /// Previous page
  @override
  Pagination previousPage() => throw UnimplementedError();

  /// Next page
  @override
  Pagination nextPage() => throw UnimplementedError();
}
