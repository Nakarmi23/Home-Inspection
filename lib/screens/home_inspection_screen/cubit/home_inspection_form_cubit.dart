import 'dart:io';

import 'package:cubit/cubit.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/repository/inspection_file_repository.dart';
import 'package:meta/meta.dart';

part 'home_inspection_form_state.dart';

class HomeInspectionFormCubit extends Cubit<HomeInspectionFormState> {
  InspectionFileRepository _inspectionFileRepository =
      InspectionFileRepository();

  HomeInspectionFormCubit() : super(HomeInspectionFormInitial());

  void readData(String filename) async {
    try {
      InspectionData data = await _inspectionFileRepository.readFile(filename);
      emit(HomeInspectionFormSuccess(inspectionData: data));
    } catch (err) {
      emit(HomeInspectionFormFailed(error: err));
    }
  }

  void saveData(InspectionData inspectionData) async {
    try {
      File inspectionDataFile =
          await _inspectionFileRepository.writeFile(inspectionData);
      InspectionData data = await _inspectionFileRepository
          .readFile(inspectionDataFile.path.split("/")[0]);

      emit(HomeInspectionFormSuccess(
        inspectionData: data,
        inspectionDataFile: inspectionDataFile,
      ));
    } catch (err) {
      emit(HomeInspectionFormFailed(error: err));
    }
  }
}
