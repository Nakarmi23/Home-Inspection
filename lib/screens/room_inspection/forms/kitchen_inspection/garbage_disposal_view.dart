part of './kitchen_inspection_form.dart';

class GarbageDisposalView extends StatefulWidget {
  const GarbageDisposalView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<GarbageDisposal> onDataChange;

  @override
  _GarbageDisposalViewState createState() => _GarbageDisposalViewState();
}

class _GarbageDisposalViewState extends State<GarbageDisposalView> {
  GarbageDisposal garbageDisposal = GarbageDisposal();

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Dish Washer'),
        ),
        InspectionImageComment(
          images: garbageDisposal.photos,
          comment: garbageDisposal.condition,
          onCommentSaved: (value) {
            garbageDisposal.condition = value;
            widget.onDataChange(garbageDisposal);
          },
          onImageAdd: (path) {
            setState(() {
              garbageDisposal.photos.add(path);
              widget.onDataChange(garbageDisposal);
            });
          },
          onImageTap: (index) {},
        )
      ],
    );
  }
}
