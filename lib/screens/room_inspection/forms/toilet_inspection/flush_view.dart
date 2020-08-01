part of './toilet_inspection_form.dart';

class FlushView extends StatefulWidget {
  const FlushView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;
  @override
  _FlushViewState createState() => _FlushViewState();
}

class _FlushViewState extends State<FlushView> {
  ImageAndComment flush = ImageAndComment();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    flush = widget.value ?? flush;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Flush'),
        ),
        InspectionImageComment(
          isInFrom: false,
          images: flush.photos,
          comment: flush.comment,
          onCommentSaved: (value) {
            flush.comment = value;
            widget.onDataChange(flush);
          },
          onImageAdd: (path) {
            setState(() {
              flush.photos.add(path);
            });
            widget.onDataChange(flush);
          },
          onImageTap: (index) {},
        ),
      ],
    );
  }
}
