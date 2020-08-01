part of './kitchen_inspection_form.dart';

class DishWasherView extends StatefulWidget {
  const DishWasherView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;
  final ImageAndComment value;
  @override
  _DishWasherViewState createState() => _DishWasherViewState();
}

class _DishWasherViewState extends State<DishWasherView> {
  ImageAndComment dishWasher = ImageAndComment();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dishWasher = widget.value ?? ImageAndComment();
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Dish Washer'),
        ),
        InspectionImageComment(
          images: dishWasher.photos,
          comment: dishWasher.comment,
          onCommentSaved: (value) {
            dishWasher.comment = value;
            widget.onDataChange(dishWasher);
          },
          onImageAdd: (path) {
            setState(() {
              dishWasher.photos.add(path);
              widget.onDataChange(dishWasher);
            });
          },
          onImageTap: (index) {},
        )
      ],
    );
  }
}
