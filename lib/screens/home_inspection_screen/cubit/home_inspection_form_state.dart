part of 'home_inspection_form_cubit.dart';

@immutable
abstract class HomeInspectionFormState {}

class HomeInspectionFormInitial extends HomeInspectionFormState {}

class HomeInspectionFromInProcess extends HomeInspectionFormState {}

class HomeInspectionFormSuccess extends HomeInspectionFormState {
  final InspectionData inspectionData;
  final File inspectionDataFile;
  HomeInspectionFormSuccess({this.inspectionData, this.inspectionDataFile});
}

class HomeInspectionFormFailed extends HomeInspectionFormState {
  final Error error;

  HomeInspectionFormFailed({this.error});
}
