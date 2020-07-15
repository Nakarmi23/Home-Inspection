import 'package:cubit/cubit.dart';
import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/repository/inspection_cause_repository.dart';
import 'package:meta/meta.dart';

part 'inspection_cause_state.dart';

class InspectionCauseCubit extends Cubit<InspectionCauseState> {
  final InspectionCauseRepository _inspectionCauseRepository =
      InspectionCauseRepository();

  InspectionCauseCubit() : super(InspectionCauseInitial());

  Future<bool> _checkIfInitialized() async {
    int count = await _inspectionCauseRepository.count();
    return count > 0;
  }

  void initializeData() async {
    try {
      final isInitialized = await _checkIfInitialized();
      if (isInitialized == false) {
        var defaultInspectionCauseList = [
          'Routine Inspection',
          'Selling Buying Case',
          'Renting',
          'Problem Encounter Case',
        ]
            .map((item) =>
                InspectionCause(inspectionCause: item, isEditable: false))
            .toList();

        await Future.wait(defaultInspectionCauseList.map((inspectionCause) =>
            _inspectionCauseRepository.insert(inspectionCause)));
      }
      loadData();
    } catch (err) {
      emit(InspectionCauseFailed(error: err));
    }
  }

  void loadData() async {
    try {
      List<InspectionCause> inspectionCause =
          (await _inspectionCauseRepository.select())
              .map((e) => InspectionCause.fromJson(e))
              .toList();

      emit(InspectionCauseSuccess(
        inspectionCause: inspectionCause,
      ));
    } catch (err) {
      emit(InspectionCauseFailed(error: err));
    }
  }
}
