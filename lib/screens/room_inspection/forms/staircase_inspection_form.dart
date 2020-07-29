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
  const StaircaseInspectionForm({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<List<StaircaseInspection>> onDataChange;

  @override
  _StaircaseInspectionFormState createState() =>
      _StaircaseInspectionFormState();
}

class _StaircaseInspectionFormState extends State<StaircaseInspectionForm> {
  List<StaircaseInspection> staircaseInspectionList = [StaircaseInspection()];
  List<GlobalKey<FormState>> _formKeys = [GlobalKey()];
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createStaircaseInspection(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Staircase'),
                ),
                Icon(
                  Icons.add_circle,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          onTap: () {
            _formKeys.add(GlobalKey());
            setState(() {
              staircaseInspectionList.add(StaircaseInspection());
            });
          },
        ),
      ],
    );
  }

  List<Form> createStaircaseInspection() {
    return staircaseInspectionList
        .asMap()
        .keys
        .map(
          (key) => Form(
            key: _formKeys[key],
            onChanged: () {
              debounceEvent(() {
                _formKeys[key].currentState.save();
                widget.onDataChange(staircaseInspectionList);
              });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: HeadingText('Staircase ${key + 1}'),
                ),
                AppInputTextField(
                  labelText: 'Location',
                  onSaved: (newValue) {
                    staircaseInspectionList[key].location = newValue;
                  },
                ),
                AppInputTextField(
                  labelText: 'Stair Case Type',
                  onSaved: (newValue) {
                    staircaseInspectionList[key].type = newValue;
                  },
                ),
                AppInputTextField(
                  labelText: 'Staircase Material',
                  onSaved: (newValue) {
                    staircaseInspectionList[key].material = newValue;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText('Clearance Condition'),
                ),
                InspectionImageComment(
                  images:
                      staircaseInspectionList[key].clearanceCondition.photos,
                  comment:
                      staircaseInspectionList[key].clearanceCondition.comment,
                  onCommentSaved: (value) {
                    staircaseInspectionList[key].clearanceCondition.comment =
                        value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      staircaseInspectionList[key]
                          .clearanceCondition
                          .photos
                          .add(path);
                    });
                    widget.onDataChange(staircaseInspectionList);
                  },
                  onImageTap: (index) {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText('Railing'),
                ),
                InspectionImageComment(
                  images: staircaseInspectionList[key].railing.photos,
                  comment: staircaseInspectionList[key].railing.comment,
                  onCommentSaved: (value) {
                    staircaseInspectionList[key].railing.comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      staircaseInspectionList[key].railing.photos.add(path);
                    });
                    widget.onDataChange(staircaseInspectionList);
                  },
                  onImageTap: (index) {},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                      'Functionality of Riser, Tread and Width of Staircase'),
                ),
                InspectionImageComment(
                  images: staircaseInspectionList[key].functionality.photos,
                  comment: staircaseInspectionList[key].functionality.comment,
                  onCommentSaved: (value) {
                    staircaseInspectionList[key].functionality.comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      staircaseInspectionList[key]
                          .functionality
                          .photos
                          .add(path);
                    });
                    widget.onDataChange(staircaseInspectionList);
                  },
                  onImageTap: (index) {},
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
              ],
            ),
          ),
        )
        .toList();
  }
}
