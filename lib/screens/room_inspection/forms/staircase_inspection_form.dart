import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/staircase_inspection/staircase_inspection.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/utility/debounce.dart';

class StaircaseInspectionForm extends StatefulWidget {
  const StaircaseInspectionForm({Key key, @required this.onDataChanged})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<StaircaseInspection> onDataChanged;

  @override
  _StaircaseInspectionFormState createState() =>
      _StaircaseInspectionFormState();
}

class _StaircaseInspectionFormState extends State<StaircaseInspectionForm> {
  StaircaseInspection staircaseInspection = StaircaseInspection();
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Form(
          key: _formKey,
          onChanged: () {
            debounceEvent(() {
              _formKey.currentState.save();
              widget.onDataChanged(staircaseInspection);
            });
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Staircase 1'),
              ),
              AppInputTextField(
                labelText: 'Location',
                onSaved: (newValue) {
                  staircaseInspection.location = newValue;
                },
              ),
              AppInputTextField(
                labelText: 'Stair Case Type',
                onSaved: (newValue) {
                  staircaseInspection.type = newValue;
                },
              ),
              AppInputTextField(
                labelText: 'Staircase Material',
                onSaved: (newValue) {
                  staircaseInspection.material = newValue;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText('Clearance Condition'),
              ),
              InspectionImageComment(
                images: staircaseInspection.clearanceCondition.photos,
                comment: staircaseInspection.clearanceCondition.comment,
                onCommentSaved: (value) {
                  staircaseInspection.clearanceCondition.comment = value;
                },
                onImageAdd: (path) {
                  setState(() {
                    staircaseInspection.clearanceCondition.photos.add(path);
                  });
                },
                onImageTap: (index) {},
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText('Railing'),
              ),
              InspectionImageComment(
                images: staircaseInspection.railing.photos,
                comment: staircaseInspection.railing.comment,
                onCommentSaved: (value) {
                  staircaseInspection.railing.comment = value;
                },
                onImageAdd: (path) {
                  setState(() {
                    staircaseInspection.railing.photos.add(path);
                  });
                },
                onImageTap: (index) {},
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                    'Functionality of Riser, Tread and Width of Staircase'),
              ),
              InspectionImageComment(
                images: staircaseInspection.functionality.photos,
                comment: staircaseInspection.functionality.comment,
                onCommentSaved: (value) {
                  staircaseInspection.functionality.comment = value;
                },
                onImageAdd: (path) {
                  setState(() {
                    staircaseInspection.functionality.photos.add(path);
                  });
                },
                onImageTap: (index) {},
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
