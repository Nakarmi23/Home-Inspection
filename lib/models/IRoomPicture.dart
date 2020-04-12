import 'package:house_review/models/IBaseModel.dart';

class IRoomPicture extends IBaseModel {
  int roomId;
  String picture;

  IRoomPicture({
    this.roomId,
    this.picture,
  });

  @override
  Map<String, dynamic> toJson() => {
        'room_id': roomId,
        'picture': picture,
      };

  @override
  IRoomPicture fromJson(Map<String, dynamic> json) {
    roomId = json['room_id'];
    picture = json['picture'];
    return this;
  }
}
