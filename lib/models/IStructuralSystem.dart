import 'package:house_review/models/IBaseModel.dart';

class IStructuralSystem extends IBaseModel<IStructuralSystem> {
  int id;
  String systemName;
  bool isEditable;
  IStructuralSystem({
    this.id,
    this.systemName,
    this.isEditable,
  });

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'system_name': systemName,
        'is_editable': isEditable ? 1 : 0,
      };

  @override
  IStructuralSystem fromJson(Map<String, dynamic> json) {
    id = json['id'];
    systemName = json['system_name'];
    isEditable = json['is_editable'] == 1 ? true : false;
    return this;
  }
}
