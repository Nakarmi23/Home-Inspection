import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class _IIsAppInitialized {
  bool structuralSystem;
  bool inspectionCause;
  bool roomPurpose;

  get isAllDataInitialized => structuralSystem && inspectionCause;

  _IIsAppInitialized(
      {this.structuralSystem, this.inspectionCause, this.roomPurpose});
}

class SplashScreenBloc {
  final Repository _repository = Repository();
  BehaviorSubject<_IIsAppInitialized> _isAppInitialized =
      BehaviorSubject<_IIsAppInitialized>();

  ValueStream<_IIsAppInitialized> get isAppInitialized =>
      _isAppInitialized.stream;

  void dispose() {
    _isAppInitialized.close();
    _isAppInitialized = BehaviorSubject<_IIsAppInitialized>();
  }

  void isDefaultDataInitialized() {
    Future.wait([
      _repository.countInspectionCause(),
      _repository.countStructuralSystem(),
    ]).then((data) {
      _isAppInitialized.add(_IIsAppInitialized(
        inspectionCause: data[0] > 0,
        structuralSystem: data[1] > 0,
      ));
    });
  }

  void initializeStructuralSystem() {
    Future.wait([
      'RCC Framed Structure',
      'Masonary Structure',
      'Steel Structure',
    ]
            .map((item) => _repository
                .insertStructuralSystem(IStructuralSystem(systemName: item)))
            .toList())
        .then((data) {
      isDefaultDataInitialized();
    }).catchError((err) {
      _isAppInitialized.addError(err);
    });
  }

  void initializeInspectionCause() {
    Future.wait([
      'Routine Inspection',
      'Selling Buying Case',
      'Renting',
      'Problem Encounter Case',
    ]
            .map((item) => _repository
                .insertInspectionCause(IInspectionCause(inspectionCause: item)))
            .toList())
        .then((data) {
      isDefaultDataInitialized();
    }).catchError((err) {
      _isAppInitialized.addError(err);
    });
  }
}
