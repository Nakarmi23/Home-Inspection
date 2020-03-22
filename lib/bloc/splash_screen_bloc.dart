import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SplashScreenBloc {
  final Repository _repository = Repository();
  BehaviorSubject<int> _structuralSystemCount = BehaviorSubject<int>();

  ValueStream<int> get structuralSystemCount => _structuralSystemCount.stream;

  void dispose() {
    _structuralSystemCount.close();
    _structuralSystemCount = BehaviorSubject<int>();
  }

  void getStructuralSystemCount() {
    _repository.countStructuralSystem().then((data) {
      _structuralSystemCount.add(data);
    }).catchError((err) {
      _structuralSystemCount.addError(err);
    });
  }

  void initializeStructuralSystem() {
    Future.wait([
      'RCC Framed Structure',
      'Masonary Structure',
      'Steel Structure'
    ]
            .map((item) => _repository
                .insertStructuralSystem(IStructuralSystem(systemName: item)))
            .toList())
        .then((data) {
      getStructuralSystemCount();
    }).catchError((err) {
      _structuralSystemCount.addError(err);
    });
  }
}
