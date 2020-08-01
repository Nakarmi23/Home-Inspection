part of './toilet_inspection_form.dart';

class ToiletPlumbingView extends StatefulWidget {
  const ToiletPlumbingView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;

  @override
  _ToiletPlumbingViewState createState() => _ToiletPlumbingViewState();
}

class _ToiletPlumbingViewState extends State<ToiletPlumbingView> {
  ImageAndComment plumbing = ImageAndComment();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    plumbing = widget.value ?? plumbing;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Plumbing'),
        ),
        InspectionImageComment(
          isInFrom: false,
          images: plumbing.photos,
          comment: plumbing.comment,
          onCommentSaved: (value) {
            plumbing.comment = value;
            widget.onDataChange(plumbing);
          },
          onImageAdd: (path) {
            setState(() {
              plumbing.photos.add(path);
            });
            widget.onDataChange(plumbing);
          },
          onImageTap: (index) {},
        ),
      ],
    );
  }
}
