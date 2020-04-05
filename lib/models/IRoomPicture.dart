class IRoomPicture {
  int roomId;
  String picture;

  IRoomPicture({
    this.roomId,
    this.picture,
  });

  IRoomPicture.fromJSON(Map<String, dynamic> json) {
    roomId = json['room_id'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() => {
        'room_id': roomId,
        'picture': picture,
      };
}
