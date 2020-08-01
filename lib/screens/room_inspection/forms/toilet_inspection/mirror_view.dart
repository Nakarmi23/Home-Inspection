part of './toilet_inspection_form.dart';

class MirrorView extends StatefulWidget {
  const MirrorView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;
  @override
  _MirrorViewState createState() => _MirrorViewState();
}

class _MirrorViewState extends State<MirrorView> {
  ImageAndComment mirror = ImageAndComment();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mirror = widget.value ?? mirror;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Mirror'),
        ),
        InspectionImageComment(
          isInFrom: false,
          images: mirror.photos,
          comment: mirror.comment,
          onCommentSaved: (value) {
            mirror.comment = value;
            widget.onDataChange(mirror);
          },
          onImageAdd: (path) {
            setState(() {
              mirror.photos.add(path);
            });
            widget.onDataChange(mirror);
          },
          onImageTap: (index) {},
        ),
      ],
    );
  }
}
