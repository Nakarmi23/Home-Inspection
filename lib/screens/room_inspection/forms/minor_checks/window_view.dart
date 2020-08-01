part of './minor_checks_form.dart';

class WindowView extends StatefulWidget {
  const WindowView({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<Window>> onDataChanged;
  final List<Window> value;
  @override
  _WindowViewState createState() => _WindowViewState();
}

class _WindowViewState extends State<WindowView> {
  List<Window> windowList = [Window()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    windowList = widget.value.isEmpty ? windowList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createWindowForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Window'),
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
              windowList.add(Window());
            });
          },
        ),
      ],
    );
  }

  List<Form> createWindowForm() => windowList
      .asMap()
      .keys
      .map(
        (windowIndex) => Form(
          key: formKeys[windowIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[windowIndex].currentState.save();
              widget.onDataChanged(windowList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Window ${windowIndex + 1}'),
              ),
              AppInputTextField(
                initialValue: windowList[windowIndex].material,
                labelText: 'Window Material',
                onSaved: (newValue) {
                  windowList[windowIndex].material = newValue;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                  'Checklist',
                ),
              ),
              ...[
                'Window Frames',
                'Window Panels',
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
                          case 'Window Frames':
                            setState(() {
                              windowList[windowIndex].windowFramesCondition =
                                  value;
                            });
                            widget.onDataChanged(windowList);
                            break;
                          case 'Window Panels':
                            setState(() {
                              windowList[windowIndex].windowPanelsCondition =
                                  value;
                            });
                            widget.onDataChanged(windowList);
                            break;
                          case 'Hinges':
                            setState(() {
                              windowList[windowIndex].hingesCondition = value;
                            });
                            widget.onDataChanged(windowList);
                            break;
                          case 'Holder':
                            setState(() {
                              windowList[windowIndex].holderCondition = value;
                            });
                            widget.onDataChanged(windowList);
                            break;
                          case 'Other Fixtures':
                            setState(() {
                              windowList[windowIndex].otherFixturesCondition =
                                  value;
                            });
                            widget.onDataChanged(windowList);
                            break;
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, windowIndex),
                    ),
                  )
                  .toList(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InspectionImageComment(
                  images: windowList[windowIndex].photos,
                  comment: windowList[windowIndex].comment,
                  onCommentSaved: (value) {
                    windowList[windowIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      windowList[windowIndex].photos.add(path);
                    });
                    widget.onDataChanged(windowList);
                  },
                  onImageTap: (index) {},
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  getCheckListConditionValue(String checkListItem, int windowIndex) {
    switch (checkListItem) {
      case 'Window Frames':
        return windowList[windowIndex].windowFramesCondition;
        break;
      case 'Window Panels':
        return windowList[windowIndex].windowPanelsCondition;
        break;
      case 'Hinges':
        return windowList[windowIndex].hingesCondition;
        break;
      case 'Holder':
        return windowList[windowIndex].holderCondition;
        break;
      case 'Other Fixtures':
        return windowList[windowIndex].otherFixturesCondition;
        break;
      default:
    }
  }
}
