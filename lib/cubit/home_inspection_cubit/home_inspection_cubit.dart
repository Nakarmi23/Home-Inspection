import 'dart:io';

import 'package:cubit/cubit.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/repository/inspection_file_repository.dart';
import 'package:meta/meta.dart';

part 'home_inspection_state.dart';

class HomeInspectionCubit extends Cubit<HomeInspectionState> {
  InspectionFileRepository _inspectionFileRepository =
      InspectionFileRepository();

  HomeInspectionCubit() : super(HomeInspectionInitial());

  void readData(String filename) async {
    try {
      InspectionData data = await _inspectionFileRepository.readFile(filename);
      emit(HomeInspectionSuccess(inspectionData: data));
    } catch (err) {
      emit(HomeInspectionFailed(error: err));
    }
  }

  void saveData(InspectionData inspectionData) async {
    try {
      File inspectionDataFile =
          await _inspectionFileRepository.writeFile(inspectionData);
      InspectionData data = await _inspectionFileRepository
          .readFile(inspectionDataFile.path.split("/").last);

      emit(HomeInspectionSuccess(
        inspectionData: data,
        inspectionDataFile: inspectionDataFile,
      ));
    } catch (err) {
      emit(HomeInspectionFailed(error: err));
    }
  }
}
