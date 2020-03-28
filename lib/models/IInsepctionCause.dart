import 'dart:core';

class IInspectionCause {
  int id;
  String inspectionCause;
  IInspectionCause({
    this.id,
    this.inspectionCause,
  });
  IInspectionCause.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    inspectionCause = json['inspection_cause'];
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'inspection_cause': inspectionCause,
      };
}
