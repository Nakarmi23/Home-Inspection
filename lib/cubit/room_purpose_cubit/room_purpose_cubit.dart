import 'package:cubit/cubit.dart';
import 'package:house_review/models/room_purpose.dart';
import 'package:house_review/repository/room_purpose_repository.dart';
import 'package:meta/meta.dart';

part 'room_purpose_state.dart';

class RoomPurposeCubit extends Cubit<RoomPurposeState> {
  final RoomPurposeRepository _roomPurposeRepository = RoomPurposeRepository();

  RoomPurposeCubit() : super(RoomPurposeInitial());

  Future<bool> _checkIfInitialized() async {
    int count = await _roomPurposeRepository.count();
    return count > 0;
  }

  void initializeData() async {
    try {
      final isInitialized = await _checkIfInitialized();
      if (isInitialized == false) {
        var defaultRoomPurposeList = [
          'Kitchen',
          'Toilet',
          'Living Room',
          'Bed Room',
          'Empty Room',
          'Verandah',
          'Terrace',
          'Pooja Kotha',
          'Shutter',
          'Store',
          'Staircase',
          'Class Room',
          'Office Room',
          'Lab'
        ].map((item) => RoomPurpose(purpose: item, isEditable: 0)).toList();

        Future.wait(defaultRoomPurposeList
            .map((roomPurpose) => _roomPurposeRepository.insert(roomPurpose)));
      }
      loadData();
    } catch (err) {
      emit(RoomPurposeFailed(error: err));
    }
  }

  void loadData() async {
    try {
      List<RoomPurpose> roomPurposeList =
          (await _roomPurposeRepository.select())
              .map((e) => RoomPurpose.fromJson(e))
              .toList();

      emit(RoomPurposeSuccess(
        roomPurpose: roomPurposeList,
      ));
    } catch (err) {
      emit(RoomPurposeFailed(error: err));
    }
  }
}
