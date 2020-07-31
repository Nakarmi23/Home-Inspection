import 'package:flutter/material.dart';
import 'package:house_review/models/minor_checks/minor_check_condition.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/radio_list.dart';
import 'package:house_review/utility/debounce.dart';

class InspectionMinorChecksCondition extends StatelessWidget {
  const InspectionMinorChecksCondition({
    Key key,
    @required this.onDataChanged,
    @required this.title,
    @required this.value,
  })  : assert(value != null),
        super(key: key);
  final ValueChanged<MinorChecksCondition> onDataChanged;
  final Widget title;
  final MinorChecksCondition value;
  Widget build(BuildContext context) {
    MinorChecksCondition minorChecksCondition = value;
    GlobalKey<FormState> formKey = GlobalKey();
    return Form(
      key: formKey,
      onChanged: () {
        debounceEvent(() {
          formKey.currentState.save();
          onDataChanged(minorChecksCondition);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: title,
          ),
          RadioList(
            groupValue: minorChecksCondition.condition,
            onChanged: (value) {
              minorChecksCondition.condition = value;
              onDataChanged(minorChecksCondition);
            },
          ),
          InspectionImageComment(
            images: minorChecksCondition.photos,
            comment: minorChecksCondition.comment,
            onCommentSaved: (value) {
              minorChecksCondition.comment = value;
            },
            onImageAdd: (path) {
              minorChecksCondition.photos.add(path);
              onDataChanged(minorChecksCondition);
            },
            onImageTap: (index) {},
            enabled: minorChecksCondition.condition != 0,
          ),
        ],
      ),
    );
  }
}
