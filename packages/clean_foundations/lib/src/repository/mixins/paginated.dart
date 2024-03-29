import 'package:clean_foundations/clean_foundations.dart';

/// Paginated Repository
mixin PaginatedRepository<M extends Model> on Repository<M> {
  Pagination? _pagination;

  /// Get current pagination infos
  Pagination? get pagination => _pagination;

  /// Set pagination infos
  set pagination(Pagination? value) => _pagination = value;

  /// Has more
  bool hasMore() => throw UnimplementedError();

  /// Load page
  Future<void> loadPage(
    Pagination? pagination, {
    bool addRecords = false,
  }) async {
    if (this is! FetchRecords) {
      throw UnimplementedError();
    }
    await (this as FetchRecords).load(
      request: RepositoryRequest({
        'pagination': pagination ?? this.pagination,
        'addRecords': addRecords,
      }),
    );
  }

  /// Load more
  Future<void> loadMore() async => loadPage(
        pagination?.nextPage(),
        addRecords: true,
      );

  /// Next page
  Future<void> nextPage() async => loadPage(pagination?.nextPage());

  /// Previous page
  Future<void> previousPage() async => loadPage(pagination?.previousPage());
}
