part of './toilet_inspection_form.dart';

class WaterClosetView extends StatefulWidget {
  const WaterClosetView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;

  @override
  _WaterClosetViewState createState() => _WaterClosetViewState();
}

class _WaterClosetViewState extends State<WaterClosetView> {
  ImageAndComment waterCloset = ImageAndComment();
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Water Closet'),
        ),
        InspectionImageComment(
          isInFrom: false,
          images: waterCloset.photos,
          comment: waterCloset.comment,
          onCommentSaved: (value) {
            waterCloset.comment = value;
            widget.onDataChange(waterCloset);
          },
          onImageAdd: (path) {
            setState(() {
              waterCloset.photos.add(path);
            });
            widget.onDataChange(waterCloset);
          },
          onImageTap: (index) {},
        ),
      ],
    );
  }
}
