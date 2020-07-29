part of './toilet_inspection_form.dart';

class FlushView extends StatefulWidget {
  const FlushView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<Flush> onDataChange;
  @override
  _FlushViewState createState() => _FlushViewState();
}

class _FlushViewState extends State<FlushView> {
  Flush flush = Flush();
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
          comment: flush.condition,
          onCommentSaved: (value) {
            flush.condition = value;
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
