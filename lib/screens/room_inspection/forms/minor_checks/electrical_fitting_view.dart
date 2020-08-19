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
  List<ElectricalFitting> elecFittingList = [ElectricalFitting(age: 1)];
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
        AddElementButton(
          title: Text('Add Electrical Fitting'),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              elecFittingList.add(ElectricalFitting(age: 1));
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
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, elecFittingIndex),
                    ),
                  )
                  .toList(),
              ...elecFittingList[elecFittingIndex]
                  .otherAccessoriesCondition
                  .asMap()
                  .keys
                  .map((accessoriesIndex) {
                MinorChecksCondition accessoriesCondition =
                    elecFittingList[elecFittingIndex]
                        .otherAccessoriesCondition[accessoriesIndex];
                return InspectionMinorChecksCondition(
                  title: SubHeadingText(
                    accessoriesCondition.otherFixtureName,
                    subHeading: SubHeading.sub2,
                  ),
                  onDataChanged: (value) {
                    setState(() {
                      accessoriesCondition = value;
                    });
                    widget.onDataChanged(elecFittingList);
                  },
                  value: accessoriesCondition,
                );
              }).toList(),
              AddElementButton(
                title: Text(
                    'Electrical Fitting ${elecFittingIndex + 1} - Add Other Accessories'),
                onTap: () {
                  buildAddOtherProblemDialog(context, Text('Other Accessories'))
                      .then((accessories) {
                    if (accessories != null) {
                      setState(() {
                        elecFittingList[elecFittingIndex]
                            .otherAccessoriesCondition
                            .add(accessories);
                      });
                    }
                  });
                },
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
      default:
    }
  }
}
