part of './minor_checks_form.dart';

class ElectricalFittingView extends StatefulWidget {
  const ElectricalFittingView(
      {Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<ElectricalFitting>> onDataChanged;
  final List<ElectricalFitting> value;
  @override
  _ElectricalFittingViewState createState() => _ElectricalFittingViewState();
}

class _ElectricalFittingViewState extends State<ElectricalFittingView> {
  List<ElectricalFitting> elecFittingList = [ElectricalFitting()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    elecFittingList = widget.value.isEmpty ? elecFittingList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createElectricalFittingForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Electrical Fitting'),
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
              elecFittingList.add(ElectricalFitting());
            });
          },
        ),
      ],
    );
  }

  List<Form> createElectricalFittingForm() => elecFittingList
      .asMap()
      .keys
      .map(
        (elecFittingIndex) => Form(
          key: formKeys[elecFittingIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[elecFittingIndex].currentState.save();
              widget.onDataChanged(elecFittingList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child:
                    HeadingText('Electrical Fitting ${elecFittingIndex + 1}'),
              ),
              AppInputTextField(
                initialValue: elecFittingList[elecFittingIndex].age.toString(),
                labelText: 'Age of Electrical Fitting',
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                onSaved: (newValue) {
                  elecFittingList[elecFittingIndex].age =
                      int.tryParse(newValue);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                  'Checklist',
                ),
              ),
              ...[
                'Wiring',
                'Switches',
                'Lights',
                'Ceiling Fan',
                'Other Accessories'
              ]
                  .map(
                    (item) => InspectionMinorChecksCondition(
                      title: SubHeadingText(
                        item,
                        subHeading: SubHeading.sub2,
                      ),
                      onDataChanged: (value) {
                        switch (item) {
                          case 'Wiring':
                            setState(() {
                              elecFittingList[elecFittingIndex]
                                  .wiringCondition = value;
                            });
                            widget.onDataChanged(elecFittingList);
                            break;
                          case 'Switches':
                            setState(() {
                              elecFittingList[elecFittingIndex]
                                  .switchesCondition = value;
                            });
                            widget.onDataChanged(elecFittingList);
                            break;
                          case 'Lights':
                            setState(() {
                              elecFittingList[elecFittingIndex]
                                  .lightsCondition = value;
                            });
                            widget.onDataChanged(elecFittingList);
                            break;
                          case 'Ceiling Fan':
                            setState(() {
                              elecFittingList[elecFittingIndex]
                                  .ceilingFanCondition = value;
                            });
                            widget.onDataChanged(elecFittingList);
                            break;
                          case 'Other Accessories':
                            setState(() {
                              elecFittingList[elecFittingIndex]
                                  .otherAccessoriesCondition = value;
                            });
                            widget.onDataChanged(elecFittingList);
                            break;
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, elecFittingIndex),
                    ),
                  )
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InspectionImageComment(
                  images: elecFittingList[elecFittingIndex].photos,
                  comment: elecFittingList[elecFittingIndex].comment,
                  onCommentSaved: (value) {
                    elecFittingList[elecFittingIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      elecFittingList[elecFittingIndex].photos.add(path);
                    });
                    widget.onDataChanged(elecFittingList);
                  },
                  onImageTap: (index) {},
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  getCheckListConditionValue(String checkListItem, int elecFittingIndex) {
    switch (checkListItem) {
      case 'Wiring':
        return elecFittingList[elecFittingIndex].wiringCondition;
        break;
      case 'Switches':
        return elecFittingList[elecFittingIndex].switchesCondition;
        break;
      case 'Lights':
        return elecFittingList[elecFittingIndex].lightsCondition;
        break;
      case 'Ceiling Fan':
        return elecFittingList[elecFittingIndex].ceilingFanCondition;
        break;
      case 'Other Accessories':
        return elecFittingList[elecFittingIndex].otherAccessoriesCondition;
        break;
      default:
    }
  }
}
