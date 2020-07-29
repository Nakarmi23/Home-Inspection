part of './kitchen_inspection_form.dart';

class GasAndGasStoveView extends StatefulWidget {
  const GasAndGasStoveView({Key key, @required this.onDataChange})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<GasAndGasStove> onDataChange;

  @override
  _GasAndGasStoveViewState createState() => _GasAndGasStoveViewState();
}

class _GasAndGasStoveViewState extends State<GasAndGasStoveView> {
  GasAndGasStove gasAndGasStove = GasAndGasStove();

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Dish Washer'),
        ),
        InspectionImageComment(
          images: gasAndGasStove.photos,
          comment: gasAndGasStove.condition,
          onCommentSaved: (value) {
            gasAndGasStove.condition = value;
            widget.onDataChange(gasAndGasStove);
          },
          onImageAdd: (path) {
            setState(() {
              gasAndGasStove.photos.add(path);
              widget.onDataChange(gasAndGasStove);
            });
          },
          onImageTap: (index) {},
        )
      ],
    );
  }
}
