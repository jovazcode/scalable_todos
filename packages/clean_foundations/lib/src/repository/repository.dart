import 'package:clean_foundations/clean_foundations.dart';

export 'mixins/mixins.dart';

export 'request.dart';
export 'response.dart';

/// Repository Definition
abstract class Repository<M extends Model> {
  /// Repository Definition
  Repository({
    required this.dataSource,
  });

  /// The data source
  final DataSource dataSource;

  /// From domain
  Dto<M> fromDomain(M model);

  /// To domain
  M toDomain(Dto<M> dto);
}
