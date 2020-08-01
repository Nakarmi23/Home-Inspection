part of './minor_checks_form.dart';

class PestInspectionView extends StatefulWidget {
  const PestInspectionView({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<PestInspection>> onDataChanged;
  final List<PestInspection> value;
  @override
  _PestInspectionViewState createState() => _PestInspectionViewState();
}

class _PestInspectionViewState extends State<PestInspectionView> {
  List<PestInspection> pestInspectionList = [PestInspection()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pestInspectionList =
        widget.value.isEmpty ? pestInspectionList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createPestInspectionForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Pest Inspection'),
                ),
                Icon(
                  Icons.add_circle,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              pestInspectionList.add(PestInspection());
            });
          },
        ),
      ],
    );
  }

  createPestInspectionForm() => pestInspectionList.asMap().keys.map(
        (pestInspectionIndex) => Form(
          key: formKeys[pestInspectionIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[pestInspectionIndex].currentState.save();
              widget.onDataChanged(pestInspectionList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child:
                    HeadingText('Pest Inspection ${pestInspectionIndex + 1}'),
              ),
              AppInputTextField(
                initialValue: pestInspectionList[pestInspectionIndex]
                    .surroundingCondition,
                labelText: 'Surrounding Condition of House',
                onSaved: (newValue) {
                  pestInspectionList[pestInspectionIndex].surroundingCondition =
                      newValue;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: InspectionImageComment(
                  images: pestInspectionList[pestInspectionIndex].photos,
                  comment: pestInspectionList[pestInspectionIndex].comment,
                  onCommentSaved: (value) {
                    pestInspectionList[pestInspectionIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      pestInspectionList[pestInspectionIndex].photos.add(path);
                    });
                    widget.onDataChanged(pestInspectionList);
                  },
                  onImageTap: (index) {},
                ),
              ),
            ],
          ),
        ),
      );
}
