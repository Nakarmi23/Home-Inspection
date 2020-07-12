part of 'inspection_cause_cubit.dart';

@immutable
abstract class InspectionCauseState {}

class InspectionCauseInitial extends InspectionCauseState {}

class InspectionCauseSuccess extends InspectionCauseState {
  final List<InspectionCause> inspectionCause;

  InspectionCauseSuccess({this.inspectionCause});
}

class InspectionCauseFailed extends InspectionCauseState {
  final Error error;

  InspectionCauseFailed({this.error});
}
