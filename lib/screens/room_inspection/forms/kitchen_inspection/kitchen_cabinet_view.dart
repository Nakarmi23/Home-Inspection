part of './kitchen_inspection_form.dart';

class KitchenCabinetView extends StatefulWidget {
  const KitchenCabinetView({Key key, @required this.onDataChange, this.value})
      : assert(onDataChange != null),
        super(key: key);
  final ValueChanged<KitchenCabinet> onDataChange;
  final KitchenCabinet value;

  @override
  _KitchenCabinetViewState createState() => _KitchenCabinetViewState();
}

class _KitchenCabinetViewState extends State<KitchenCabinetView> {
  KitchenCabinet kitchenCabinet = KitchenCabinet();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    kitchenCabinet = widget.value ?? kitchenCabinet;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Form(
          key: _formKey,
          onChanged: () {
            debounceEvent(() {
              _formKey.currentState.save();
              widget.onDataChange(kitchenCabinet);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Kitchen Cabinet'),
              ),
              AppInputTextField(
                initialValue: kitchenCabinet.material,
                labelText: 'Cabinet Material',
                onSaved: (newValue) {
                  kitchenCabinet.material = newValue;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: InspectionImageComment(
                  images: kitchenCabinet.photos,
                  comment: kitchenCabinet.comment,
                  onCommentSaved: (value) {
                    kitchenCabinet.comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      kitchenCabinet.photos.add(path);
                      widget.onDataChange(kitchenCabinet);
                    });
                  },
                  onImageTap: (index) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
