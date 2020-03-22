import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeInspectionScreenBloc {
  final Repository _repository = Repository();
  BehaviorSubject<List<IStructuralSystem>> _structuralSystem =
      BehaviorSubject<List<IStructuralSystem>>();

  ValueStream<List<IStructuralSystem>> get structuralSystem =>
      _structuralSystem.stream;

  void dispose() {
    _structuralSystem.close();
    _structuralSystem = BehaviorSubject<List<IStructuralSystem>>();
  }

  Future<List<IStructuralSystem>> getStrycturalSystem() {
    _repository
        .selectStructuralSystem()
        .then((data) => {_structuralSystem.add(data)})
        .catchError((err) => {_structuralSystem.addError(err)});
  }
}
