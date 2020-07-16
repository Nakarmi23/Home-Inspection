import 'package:cubit/cubit.dart';
import 'package:house_review/repository/structural_system_repository.dart';
import 'package:meta/meta.dart';
import 'package:house_review/models/structural_system.dart';
part 'structural_system_state.dart';

class StructuralSystemCubit extends Cubit<StructuralSystemState> {
  final StructuralSysRepository _structuralSysRepository =
      StructuralSysRepository();

  StructuralSystemCubit() : super(StructuralSystemInitial());

  Future<bool> _checkIfInitialized() async {
    int count = await _structuralSysRepository.count();
    return count > 0;
  }

  void initializeData() async {
    try {
      final isInitialized = await _checkIfInitialized();
      if (isInitialized == false) {
        var defaultStructuralSystem = [
          'RCC Framed Structure',
          'Masonary Structure',
          'Steel Structure',
        ]
            .map((item) => StructuralSystem(systemName: item, isEditable: 0))
            .toList();

        await Future.wait(defaultStructuralSystem.map((structuralSystem) =>
            _structuralSysRepository.insert(structuralSystem)));
      }

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
