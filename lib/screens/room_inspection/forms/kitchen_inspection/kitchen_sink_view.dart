part of './kitchen_inspection_form.dart';

class KitchenSinkView extends StatefulWidget {
  const KitchenSinkView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;

  @override
  _KitchenSinkViewState createState() => _KitchenSinkViewState();
}

class _KitchenSinkViewState extends State<KitchenSinkView> {
  ImageAndComment kitchenSink = ImageAndComment();

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Dish Washer'),
        ),
        InspectionImageComment(
          images: kitchenSink.photos,
          comment: kitchenSink.comment,
          onCommentSaved: (value) {
            kitchenSink.comment = value;
            widget.onDataChange(kitchenSink);
          },
          onImageAdd: (path) {
            setState(() {
              kitchenSink.photos.add(path);
              widget.onDataChange(kitchenSink);
            });
          },
          onImageTap: (index) {},
        )
      ],
    );
  }
}
