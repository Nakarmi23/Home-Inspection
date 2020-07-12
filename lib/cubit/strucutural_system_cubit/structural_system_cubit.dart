import 'package:cubit/cubit.dart';
import 'package:house_review/repository/structural_system_repository.dart';
import 'package:meta/meta.dart';
import 'package:house_review/models/structural_system.dart';
part 'structural_system_state.dart';

class StructuralSystemCubit extends Cubit<StructuralSystemState> {
  final StructuralSysRepository _structuralSysRepository =
      StructuralSysRepository();

  StructuralSystemCubit() : super(StructuralSystemInitial());

  void initializeData() async {
    var defaultStructuralSystem = [
      'RCC Framed Structure',
      'Masonary Structure',
      'Steel Structure',
    ]
        .map((item) => StructuralSystem(systemName: item, isEditable: false))
        .toList();
    try {
      await Future.wait(defaultStructuralSystem.map((structuralSystem) =>
          _structuralSysRepository.insert(structuralSystem)));

      loadData();
    } catch (err) {
      emit(StructuralSystemFailed(error: err));
    }
  }

  void loadData() async {
    try {
      List<StructuralSystem> structuralSystemList =
          (await _structuralSysRepository.select())
              .map((e) => StructuralSystem.fromJson(e))
              .toList();

      emit(StructuralSystemSuccess(
        structuralSystem: structuralSystemList,
      ));
    } catch (err) {
      emit(StructuralSystemFailed(error: err));
    }
  }
}
