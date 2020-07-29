part of './toilet_inspection_form.dart';

class ToiletPlumbingView extends StatefulWidget {
  const ToiletPlumbingView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<Plumbing> onDataChange;

  @override
  _ToiletPlumbingViewState createState() => _ToiletPlumbingViewState();
}

class _ToiletPlumbingViewState extends State<ToiletPlumbingView> {
  Plumbing plumbing = Plumbing();
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
          comment: plumbing.condition,
          onCommentSaved: (value) {
            plumbing.condition = value;
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
