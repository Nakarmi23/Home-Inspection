import 'dart:core';

class IStructuralSystem {
  int id;
  String systemName;
  bool isEditable;
  IStructuralSystem({
    this.id,
    this.systemName,
    this.isEditable,
  });
  IStructuralSystem.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    systemName = json['system_name'];
    isEditable = json['is_editable'] == 1 ? true : false;
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'system_name': systemName,
        'is_editable': isEditable ? 1 : 0,
      };
}
