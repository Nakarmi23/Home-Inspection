import 'package:house_review/models/IBaseModel.dart';

class IInspectionCause extends IBaseModel<IInspectionCause> {
  int id;
  String inspectionCause;
  bool isEditable;
  IInspectionCause({
    this.id,
    this.inspectionCause,
    this.isEditable,
  });

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'inspection_cause': inspectionCause,
        'is_editable': isEditable ? 1 : 0,
      };

  @override
  IInspectionCause fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inspectionCause = json['inspection_cause'];
    isEditable = json['is_editable'] == 1 ? true : false;
    return this;
  }
}
