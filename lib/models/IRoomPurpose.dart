class IRoomPurpose {
  int id;
  String purpose;

  IRoomPurpose({this.id, this.purpose});

  IRoomPurpose.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'purpose': purpose,
      };
}
