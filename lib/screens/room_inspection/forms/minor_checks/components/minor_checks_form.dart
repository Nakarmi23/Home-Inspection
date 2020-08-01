import 'package:flutter/material.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/models/image_comment.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';

class MinorChecksImageCommentForm extends StatefulWidget {
  const MinorChecksImageCommentForm(
      {Key key, @required this.title, @required this.onDataChanged, this.value})
      : super(key: key);
  final String title;
  final ValueChanged<List<ImageAndComment>> onDataChanged;
  final List<ImageAndComment> value;
  @override
  _MinorChecksImageCommentFormState createState() =>
      _MinorChecksImageCommentFormState();
}

class _MinorChecksImageCommentFormState
    extends State<MinorChecksImageCommentForm> {
  List<ImageAndComment> imageAndCommentList = [ImageAndComment()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imageAndCommentList =
        widget.value.isEmpty ? imageAndCommentList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createImageCommentForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add ${widget.title}'),
                ),
                Icon(
                  Icons.add_circle,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              imageAndCommentList.add(ImageAndComment());
            });
          },
        ),
      ],
    );
  }

  List<Column> createImageCommentForm() => imageAndCommentList
      .asMap()
      .keys
      .map(
        (e) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: HeadingText('${widget.title} ${e + 1}'),
            ),
            InspectionImageComment(
              isInFrom: false,
              images: imageAndCommentList[e].photos,
              comment: imageAndCommentList[e].comment,
              onCommentSaved: (value) {
                imageAndCommentList[e].comment = value;
                widget.onDataChanged(imageAndCommentList);
              },
              onImageAdd: (path) {
                imageAndCommentList[e].photos.add(path);
                widget.onDataChanged(imageAndCommentList);
              },
              onImageTap: (index) {},
            ),
          ],
        ),
      )
      .toList();
}
