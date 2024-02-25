import 'package:clean_foundations/clean_foundations.dart';

import 'package:rxdart/subjects.dart';

/// Stateful Repository
mixin StatefulRepository<ModelT extends Object> on Repository<ModelT> {
  List<ModelT>? _state;

  final BehaviorSubject<List<ModelT>> _dataStreamController =
      BehaviorSubject<List<ModelT>>.seeded(const []);

  /// Watch cached records
  Stream<List<ModelT>> records() => _dataStreamController.asBroadcastStream();

  /// Get cached data
  List<ModelT>? get state => _state;

  /// Cache data
  set state(List<ModelT>? value) {
    _state = value;
    _dataStreamController.add(value ?? []);
  }
}
