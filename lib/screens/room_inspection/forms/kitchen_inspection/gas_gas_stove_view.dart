part of './kitchen_inspection_form.dart';

class GasAndGasStoveView extends StatefulWidget {
  const GasAndGasStoveView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<ImageAndComment> onDataChange;

  final ImageAndComment value;
  @override
  _GasAndGasStoveViewState createState() => _GasAndGasStoveViewState();
}

class _GasAndGasStoveViewState extends State<GasAndGasStoveView> {
  ImageAndComment gasAndGasStove = ImageAndComment();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    gasAndGasStove = widget.value ?? ImageAndComment();
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
          images: gasAndGasStove.photos,
          comment: gasAndGasStove.comment,
          onCommentSaved: (value) {
            gasAndGasStove.comment = value;
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
