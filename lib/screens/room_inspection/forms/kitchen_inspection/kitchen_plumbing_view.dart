part of './kitchen_inspection_form.dart';

class KitchenPlumbingView extends StatefulWidget {
  const KitchenPlumbingView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;

  @override
  _KitchenPlumbingViewState createState() => _KitchenPlumbingViewState();
}

class _KitchenPlumbingViewState extends State<KitchenPlumbingView> {
  ImageAndComment plumbing = ImageAndComment();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    plumbing = widget.value ?? ImageAndComment();
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Dish Washer'),
        ),
        InspectionImageComment(
          images: plumbing.photos,
          comment: plumbing.comment,
          onCommentSaved: (value) {
            plumbing.comment = value;
            widget.onDataChange(plumbing);
          },
          onImageAdd: (path) {
            setState(() {
              plumbing.photos.add(path);
              widget.onDataChange(plumbing);
            });
          },
          onImageTap: (index) {},
        )
      ],
    );
  }
}
