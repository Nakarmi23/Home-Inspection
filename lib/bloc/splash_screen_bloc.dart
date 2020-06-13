import 'package:house_review/models/IInsepctionCause.dart';
import 'package:house_review/models/IRoomPurpose.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/resources/root_repository.dart';
import 'package:rxdart/rxdart.dart';

class _IIsAppInitialized {
  bool structuralSystem;
  bool inspectionCause;
  bool roomPurpose;

  get isAllDataInitialized =>
      structuralSystem && inspectionCause && roomPurpose;

  _IIsAppInitialized(
      {this.structuralSystem, this.inspectionCause, this.roomPurpose});
}

class SplashScreenBloc {
  final RootRepository _repository = RootRepository();
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
      _repository.inspectionCauesService.count(),
      _repository.structuralSysService.count(),
      _repository.roomPurposeService.count(),
    ]).then((data) {
      _isAppInitialized.add(_IIsAppInitialized(
          inspectionCause: data[0] > 0,
          structuralSystem: data[1] > 0,
          roomPurpose: data[2] > 0));
    });
  }

  void initializeStructuralSystem() {
    var defaultStructuralSystem = [
      'RCC Framed Structure',
      'Masonary Structure',
      'Steel Structure',
    ]
        .map((item) => IStructuralSystem(systemName: item, isEditable: false))
        .toList();

    Future.wait(defaultStructuralSystem.map((structuralSystem) =>
            _repository.structuralSysService.insert(structuralSystem)))
        .then((data) {
      isDefaultDataInitialized();
    }).catchError((err) {
      _isAppInitialized.addError(err);
    });
  }

  void initializeInspectionCause() {
    var defaultInspectionCauseList = [
      'Routine Inspection',
      'Selling Buying Case',
      'Renting',
      'Problem Encounter Case',
    ]
        .map((item) =>
            IInspectionCause(inspectionCause: item, isEditable: false))
        .toList();

    Future.wait(defaultInspectionCauseList.map((inspectionCause) =>
            _repository.inspectionCauesService.insert(inspectionCause)))
        .then((data) {
      isDefaultDataInitialized();
    }).catchError((err) {
      _isAppInitialized.addError(err);
    });
  }

  void initializeRoomPurpose() {
    var defaultRoomPurposeList = [
      'Kitchen',
      'Toilet',
      'Living Room',
      'Bed Room',
      'Empty Room',
      'Verandah',
      'Terrace',
      'Pooja Kotha',
      'Shutter',
      'Store',
      'Staircase',
      'Class Room',
      'Office Room',
      'Lab'
    ].map((item) => IRoomPurpose(purpose: item, isEditable: false)).toList();

    Future.wait(defaultRoomPurposeList.map((roomPurpose) =>
        _repository.roomPurposeService.insert(roomPurpose))).then((data) {
      isDefaultDataInitialized();
    }).catchError((err) {
      _isAppInitialized.addError(err);
    });
  }
}
