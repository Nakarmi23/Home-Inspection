part of './kitchen_inspection_form.dart';

class KitchenPlumbingView extends StatefulWidget {
  const KitchenPlumbingView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<Plumbing> onDataChange;

  @override
  _KitchenPlumbingViewState createState() => _KitchenPlumbingViewState();
}

class _KitchenPlumbingViewState extends State<KitchenPlumbingView> {
  Plumbing plumbing = Plumbing();

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
          comment: plumbing.condition,
          onCommentSaved: (value) {
            plumbing.condition = value;
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
