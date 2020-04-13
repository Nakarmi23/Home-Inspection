import 'package:house_review/models/IBaseModel.dart';

class IRoomPurpose extends IBaseModel<IRoomPurpose> {
  int id;
  String purpose;
  bool isEditable;

  IRoomPurpose({this.id, this.purpose, this.isEditable});

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'purpose': purpose,
        'is_editable': isEditable ? 1 : 0,
      };

  @override
  IRoomPurpose fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purpose = json['purpose'];
    isEditable = json['is_editable'] == 1 ? true : false;
    return this;
  }
}
