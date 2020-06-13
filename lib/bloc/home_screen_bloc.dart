import 'dart:async';

import 'package:house_review/models/IClient.dart';
import 'package:house_review/resources/root_repository.dart';

class HomeScreenBloc {
  final RootRepository _repository = RootRepository();
  int _currentCount = 0;
  StreamController<List<IClient>> _client = StreamController<List<IClient>>();

  Stream<List<IClient>> get client => _client.stream;

  void getClientData() {
    _repository.clientService
        .select(limit: 20, offset: _currentCount, orderBy: 'id desc')
        .then((value) {
      if (value.length > 0) _currentCount = value.length;
      _client.sink.add(value);
    }).catchError((err) => throw err);
  }
}
