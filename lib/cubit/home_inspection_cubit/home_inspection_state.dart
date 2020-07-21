part of 'home_inspection_cubit.dart';

@immutable
abstract class HomeInspectionState {}

class HomeInspectionInitial extends HomeInspectionState {}

class HomeInspectionInProcess extends HomeInspectionState {}

class HomeInspectionSuccess extends HomeInspectionState {
  final InspectionData inspectionData;
  final File inspectionDataFile;
  HomeInspectionSuccess({this.inspectionData, this.inspectionDataFile});
}

class HomeInspectionFailed extends HomeInspectionState {
  final Error error;

  HomeInspectionFailed({this.error});
}
