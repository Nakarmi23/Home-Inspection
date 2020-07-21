import 'package:cubit/cubit.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/inspection_file_info.dart';
import 'package:house_review/repository/inspection_file_info_repository.dart';
import 'package:meta/meta.dart';

part 'inspection_file_info_state.dart';

class InspectionFileInfoCubit extends Cubit<InspectionFileInfoState> {
  InspectionFileInfoRepository _fileInfoRepository =
      InspectionFileInfoRepository();

  InspectionFileInfoCubit() : super(InspectionFileInfoInitial());

  void loadData() async {
    try {
      List<InspectionFileInfo> fileInfo = (await _fileInfoRepository.select())
          .map((item) => InspectionFileInfo.fromJson(item))
          .toList();
      emit(InspectionFileInfoSuccess(inspectionFileInfos: fileInfo));
    } catch (err) {
      emit(InspectionFileInfoFailed(error: err));
    }
  }

  void saveData(InspectionFileInfo inspectionFileInfo) async {
    try {
      await _fileInfoRepository.insert(inspectionFileInfo);
      loadData();
    } catch (err) {
      emit(InspectionFileInfoFailed(error: err));
    }
  }
}
