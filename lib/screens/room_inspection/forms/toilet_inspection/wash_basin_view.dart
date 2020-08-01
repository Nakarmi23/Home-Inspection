part of './toilet_inspection_form.dart';

class WashBasinView extends StatefulWidget {
  const WashBasinView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;

  @override
  _WashBasinViewState createState() => _WashBasinViewState();
}

class _WashBasinViewState extends State<WashBasinView> {
  ImageAndComment washBasin = ImageAndComment();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    washBasin = widget.value ?? washBasin;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Wash Basin'),
        ),
        InspectionImageComment(
          isInFrom: false,
          images: washBasin.photos,
          comment: washBasin.comment,
          onCommentSaved: (value) {
            washBasin.comment = value;
            widget.onDataChange(washBasin);
          },
          onImageAdd: (path) {
            setState(() {
              washBasin.photos.add(path);
            });
            widget.onDataChange(washBasin);
          },
          onImageTap: (index) {},
        ),
      ],
    );
  }
}
