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
    @required this.onCommentChange,
    @required this.onImageAdd,
    @required this.onImageTap,
  })  : assert(onCommentChange != null),
        assert(onImageAdd != null),
        assert(images != null),
        super(key: key);

  final List<String> images;
  final String comment;
  final FormFieldValidator<String> commentValidator;
  final ValueChanged<String> onCommentChange;
  final OnImageAdd onImageAdd;
  final OnImageTap onImageTap;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey();
    return Form(
      key: _formKey,
      autovalidate: true,
      onChanged: () {
        debounceEvent(() {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
          }
        });
      },
      child: Column(
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
              ),
            ),
          ),
          AppInputTextField(
            labelText: 'Comment',
            initialValue: comment ?? '',
            validator: commentValidator ??
                (value) {
                  switch (value) {
                    case '':
                      return 'Comment cannot be empty';
                      break;
                    default:
                  }
                },
            onSaved: (newValue) {
              onCommentChange(newValue);
            },
          )
        ],
      ),
    );
  }
}
