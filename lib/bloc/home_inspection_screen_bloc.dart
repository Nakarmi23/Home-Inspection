import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/root_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeInspectionScreenBloc {
  final RootRepository _repository = RootRepository();
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
    _repository.structuralSysService
        .select()
        .then((data) => {_structuralSystem.add(data)})
        .catchError((err) => {_structuralSystem.addError(err)});
  }

  void getInspectionCause() {
    _repository.inspectionCauesService
        .select()
        .then((data) => {_inspectionCause.add(data)})
        .catchError((err) => {_inspectionCause.addError(err)});
  }
}
