import 'package:clean_foundations/clean_foundations.dart';

export 'mixins/mixins.dart';

export 'request.dart';
export 'response.dart';

/// Repository Definition
abstract class Repository<ModelT extends Object> {
  /// Repository Definition
  Repository({
    required this.dataSource,
  });

  /// The data source
  final DataSource<ModelT> dataSource;
}
