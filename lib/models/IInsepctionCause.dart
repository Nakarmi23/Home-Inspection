import 'dart:core';

class IInspectionCause {
  int id;
  String inspectionCause;
  bool isEditable;
  IInspectionCause({
    this.id,
    this.inspectionCause,
    this.isEditable,
  });
  IInspectionCause.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    inspectionCause = json['inspection_cause'];
    isEditable = json['is_editable'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'inspection_cause': inspectionCause,
        'is_editable': isEditable,
      };
}
