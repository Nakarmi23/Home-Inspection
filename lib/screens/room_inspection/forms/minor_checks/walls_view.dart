part of './minor_checks_form.dart';

class WallsView extends StatefulWidget {
  const WallsView({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<Wall>> onDataChanged;
  final List<Wall> value;
  @override
  _WallsViewState createState() => _WallsViewState();
}

class _WallsViewState extends State<WallsView> {
  List<Wall> wallList = [Wall()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    wallList = widget.value.isEmpty ? wallList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createCellingForm(),
        AddElementButton(
          title: Text('Add Wall'),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              wallList.add(Wall());
            });
          },
        ),
      ],
    );
  }

  List<Form> createCellingForm() => wallList
      .asMap()
      .keys
      .map(
        (wallIndex) => Form(
          key: formKeys[wallIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[wallIndex].currentState.save();
              widget.onDataChanged(wallList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Wall ${wallIndex + 1}'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                  'Checklist',
                ),
              ),
              ...['Painting', 'Plastering', 'Mason Problems']
                  .map(
                    (item) => InspectionMinorChecksCondition(
                      title: SubHeadingText(
                        item,
                        subHeading: SubHeading.sub2,
                      ),
                      onDataChanged: (value) {
                        switch (item) {
                          case 'Painting':
                            setState(() {
                              wallList[wallIndex].paintingCondition = value;
                            });
                            widget.onDataChanged(wallList);
                            break;
                          case 'Plastering':
                            setState(() {
                              wallList[wallIndex].plasteringCondition = value;
                            });
                            widget.onDataChanged(wallList);
                            break;
                          case 'Mason Problems':
                            setState(() {
                              wallList[wallIndex].masonProblemCondition = value;
                            });
                            widget.onDataChanged(wallList);
                            break;
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, wallIndex),
                    ),
                  )
                  .toList(),
              ...wallList[wallIndex]
                  .otherProblemCondition
                  .asMap()
                  .keys
                  .map((otherProblemIndex) {
                MinorChecksCondition problemCondition = wallList[wallIndex]
                    .otherProblemCondition[otherProblemIndex];
                return InspectionMinorChecksCondition(
                  title: SubHeadingText(
                    problemCondition.otherFixtureName,
                    subHeading: SubHeading.sub2,
                  ),
                  onDataChanged: (value) {
                    setState(() {
                      problemCondition = value;
                    });
                    widget.onDataChanged(wallList);
                  },
                  value: problemCondition,
                );
              }).toList(),
              AddElementButton(
                title: Text('Wall ${wallIndex + 1} - Add Other Problem'),
                onTap: () {
                  buildAddOtherProblemDialog(context, Text('Other Problem'))
                      .then((problem) {
                    if (problem != null) {
                      setState(() {
                        wallList[wallIndex].otherProblemCondition.add(problem);
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

  getCheckListConditionValue(String checkListItem, int wallIndex) {
    switch (checkListItem) {
      case 'Painting':
        return wallList[wallIndex].paintingCondition;
        break;
      case 'Plastering':
        return wallList[wallIndex].plasteringCondition;
        break;
      case 'Mason Problems':
        return wallList[wallIndex].masonProblemCondition;
        break;
      default:
    }
  }
}
