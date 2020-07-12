part of 'structural_system_cubit.dart';

@immutable
abstract class StructuralSystemState {}

class StructuralSystemInitial extends StructuralSystemState {}

class StructuralSystemSuccess extends StructuralSystemState {
  final List<StructuralSystem> structuralSystem;

  StructuralSystemSuccess({this.structuralSystem});
}

class StructuralSystemFailed extends StructuralSystemState {
  final Error error;

  StructuralSystemFailed({this.error});
}
