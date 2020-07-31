import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/utility/debounce.dart';

class InspectionImageComment extends StatelessWidget {
  InspectionImageComment({
    Key key,
    @required this.images,
    @required this.comment,
    this.commentValidator,
    @required this.onCommentSaved,
    @required this.onImageAdd,
    @required this.onImageTap,
    this.isInFrom = true,
    this.enabled = true,
  })  : assert(onCommentSaved != null),
        assert(onImageAdd != null),
        assert(images != null),
        super(key: key);

  final List<String> images;
  final String comment;
  final FormFieldValidator<String> commentValidator;
  final ValueChanged<String> onCommentSaved;
  final OnImageAdd onImageAdd;
  final OnImageTap onImageTap;
  final bool isInFrom;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey();
    var formFields = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SizedBox(
            height: 80,
            child: ImageListViewBuilder(
              onImageAdd: onImageAdd,
              onImageTap: onImageTap,
              images: images,
              enabled: enabled,
            ),
          ),
        ),
        AppInputTextField(
          labelText: 'Comment',
          enabled: enabled,
          initialValue: comment ?? '',
          validator: commentValidator != null
              ? commentValidator
              : (value) {
                  switch (value) {
                    case '':
                      return 'Comment cannot be empty';
                      break;
                    default:
                  }
                },
          onSaved: (newValue) {
            onCommentSaved(newValue);
          },
        )
      ],
    );
    return this.isInFrom
        ? formFields
        : Form(
            key: _formKey,
            autovalidate: true,
            onChanged: () {
              debounceEvent(() {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              });
            },
            child: formFields,
          );
  }
}
