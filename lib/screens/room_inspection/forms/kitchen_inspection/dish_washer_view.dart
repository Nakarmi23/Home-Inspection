part of './kitchen_inspection_form.dart';

class DishWasherView extends StatefulWidget {
  const DishWasherView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<DishWasher> onDataChange;
  @override
  _DishWasherViewState createState() => _DishWasherViewState();
}

class _DishWasherViewState extends State<DishWasherView> {
  DishWasher dishWasher = DishWasher();
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
          comment: dishWasher.condition,
          onCommentSaved: (value) {
            dishWasher.condition = value;
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
