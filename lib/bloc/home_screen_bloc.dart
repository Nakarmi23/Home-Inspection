import 'dart:async';

import 'package:house_review/models/IClient.dart';
import 'package:house_review/resources/root_repository.dart';

class HomeScreenBloc {
  final RootRepository _repository = RootRepository();
  int _clientCount = 0;
  int _currentCount = 0;
  StreamController<List<IClient>> _client = StreamController<List<IClient>>();

  Stream<List<IClient>> get client => _client.stream;

  Future getClientCount() {
    return _repository.clientService
        .count()
        .then((value) => {_clientCount = value})
        .catchError((err) => throw err);
  }

  void getClientData() {
    if (_currentCount < _clientCount)
      _repository.clientService
          .select(limit: 20, offset: _currentCount, orderBy: 'id desc')
          .then((value) {
        _currentCount = value.length;
        _client.sink.add(value);
      }).catchError((err) => throw err);
  }
}
