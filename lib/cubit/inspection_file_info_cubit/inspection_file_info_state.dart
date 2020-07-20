part of 'inspection_file_info_cubit.dart';

@immutable
abstract class InspectionFileInfoState {}

class InspectionFileInfoInitial extends InspectionFileInfoState {}

class InspectionFileInfoSuccess extends InspectionFileInfoState {
  final List<InspectionFileInfo> inspectionFileInfos;

  InspectionFileInfoSuccess({this.inspectionFileInfos});
}

class InspectionFileInfoFailed extends InspectionFileInfoState {
  final Error error;

  InspectionFileInfoFailed({this.error});
}
