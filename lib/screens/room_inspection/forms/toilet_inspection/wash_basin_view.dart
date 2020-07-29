part of './toilet_inspection_form.dart';

class WashBasinView extends StatefulWidget {
  const WashBasinView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<WashBasin> onDataChange;

  @override
  _WashBasinViewState createState() => _WashBasinViewState();
}

class _WashBasinViewState extends State<WashBasinView> {
  WashBasin washBasin = WashBasin();
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
          comment: washBasin.condition,
          onCommentSaved: (value) {
            washBasin.condition = value;
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
