import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeInspectionScreenBloc {
  final Repository _repository = Repository();
  BehaviorSubject<List<IStructuralSystem>> _structuralSystem =
      BehaviorSubject<List<IStructuralSystem>>();
  BehaviorSubject<List<IInspectionCause>> _inspectionCause =
      BehaviorSubject<List<IInspectionCause>>();

  ValueStream<List<IStructuralSystem>> get structuralSystem =>
      _structuralSystem.stream;

  ValueStream<List<IInspectionCause>> get inspectionCause =>
      _inspectionCause.stream;

  void dispose() {
    _structuralSystem.close();
    _structuralSystem = BehaviorSubject<List<IStructuralSystem>>();
    _inspectionCause.close();
    _inspectionCause = BehaviorSubject<List<IInspectionCause>>();
  }

  void getStructuralSystem() {
    _repository
        .selectStructuralSystem()
        .then((data) => {_structuralSystem.add(data)})
        .catchError((err) => {_structuralSystem.addError(err)});
  }

  void getInspectionCause() {
    _repository
        .selectInspectionCause()
        .then((data) => {_inspectionCause.add(data)})
        .catchError((err) => {_inspectionCause.addError(err)});
  }
}
