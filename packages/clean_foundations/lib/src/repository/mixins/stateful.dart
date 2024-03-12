import 'package:clean_foundations/clean_foundations.dart';

import 'package:rxdart/subjects.dart';

/// Stateful Repository
mixin StatefulRepository<M extends Model> on Repository<M> {
  List<Dto<M>>? _state;

  final BehaviorSubject<List<Dto<M>>> _dataStreamController =
      BehaviorSubject<List<Dto<M>>>.seeded(const []);

  /// Watch cached records
  Stream<List<M>> records() => _dataStreamController
      .asBroadcastStream()
      .map((event) => event.map(toDomain).toList());

  /// Get cached data
  List<M>? get state => _state?.map(toDomain).toList();

  /// Cache data
  set state(List<M>? value) {
    _state = value?.map(fromDomain).toList();
    _dataStreamController.add(_state ?? []);
  }
}
