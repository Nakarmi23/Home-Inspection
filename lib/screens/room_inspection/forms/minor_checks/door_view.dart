part of './minor_checks_form.dart';

class DoorView extends StatefulWidget {
  const DoorView({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<Door>> onDataChanged;
  final List<Door> value;

  @override
  _DoorViewState createState() => _DoorViewState();
}

class _DoorViewState extends State<DoorView> {
  List<Door> doorList = [Door()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    doorList = widget.value.isEmpty ? doorList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createDoorForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Door'),
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
              doorList.add(Door());
            });
          },
        ),
      ],
    );
  }

  List<Form> createDoorForm() => doorList
      .asMap()
      .keys
      .map(
        (doorIndex) => Form(
          key: formKeys[doorIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[doorIndex].currentState.save();
              widget.onDataChanged(doorList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Door ${doorIndex + 1}'),
              ),
              AppInputTextField(
                initialValue: doorList[doorIndex].material,
                labelText: 'Door Material',
                onSaved: (newValue) {
                  doorList[doorIndex].material = newValue;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                  'Checklist',
                ),
              ),
              ...[
                'Door Frames',
                'Door Panels',
                'Hinges',
                'Holder',
                'Other Fixtures'
              ]
                  .map(
                    (item) => InspectionMinorChecksCondition(
                      title: SubHeadingText(
                        item,
                        subHeading: SubHeading.sub2,
                      ),
                      onDataChanged: (value) {
                        switch (item) {
                          case 'Door Frames':
                            setState(() {
                              doorList[doorIndex].doorFramesCondition = value;
                            });
                            widget.onDataChanged(doorList);
                            break;
                          case 'Door Panels':
                            setState(() {
                              doorList[doorIndex].doorPanelsCondition = value;
                            });
                            widget.onDataChanged(doorList);
                            break;
                          case 'Hinges':
                            setState(() {
                              doorList[doorIndex].hingesCondition = value;
                            });
                            widget.onDataChanged(doorList);
                            break;
                          case 'Holder':
                            setState(() {
                              doorList[doorIndex].holderCondition = value;
                            });
                            widget.onDataChanged(doorList);
                            break;
                          case 'Other Fixtures':
                            setState(() {
                              doorList[doorIndex].otherFixturesCondition =
                                  value;
                            });
                            widget.onDataChanged(doorList);
                            break;
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, doorIndex),
                    ),
                  )
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InspectionImageComment(
                  images: doorList[doorIndex].photos,
                  comment: doorList[doorIndex].comment,
                  onCommentSaved: (value) {
                    doorList[doorIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      doorList[doorIndex].photos.add(path);
                    });
                    widget.onDataChanged(doorList);
                  },
                  onImageTap: (index) {},
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  getCheckListConditionValue(String checkListItem, int doorIndex) {
    switch (checkListItem) {
      case 'Door Frames':
        return doorList[doorIndex].doorFramesCondition;
        break;
      case 'Door Panels':
        return doorList[doorIndex].doorPanelsCondition;
        break;
      case 'Hinges':
        return doorList[doorIndex].hingesCondition;
        break;
      case 'Holder':
        return doorList[doorIndex].holderCondition;
        break;
      case 'Other Fixtures':
        return doorList[doorIndex].otherFixturesCondition;
        break;
      default:
    }
  }
}
