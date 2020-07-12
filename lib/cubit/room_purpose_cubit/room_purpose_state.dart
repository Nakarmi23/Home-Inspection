part of 'room_purpose_cubit.dart';

@immutable
abstract class RoomPurposeState {}

class RoomPurposeInitial extends RoomPurposeState {}

class RoomPurposeSuccess extends RoomPurposeState {
  final List<RoomPurpose> roomPurpose;

  RoomPurposeSuccess({this.roomPurpose});
}

class RoomPurposeFailed extends RoomPurposeState {
  final Error error;

  RoomPurposeFailed({this.error});
}
