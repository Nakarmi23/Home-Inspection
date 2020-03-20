import 'dart:core';

class IStructuralSystem {
  int id;
  String systemName;
  IStructuralSystem({
    this.id,
    this.systemName,
  });
  IStructuralSystem.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    systemName = json['system_name'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'system_name': systemName,
      };
}
