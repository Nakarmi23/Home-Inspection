part of './minor_checks_form.dart';

class CellingView extends StatefulWidget {
  const CellingView({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<Ceiling>> onDataChanged;
  final List<Ceiling> value;
  @override
  _CellingViewState createState() => _CellingViewState();
}

class _CellingViewState extends State<CellingView> {
  List<Ceiling> cellingList = [Ceiling()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cellingList = widget.value.isEmpty ? cellingList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createCellingForm(),
        AddElementButton(
          title: Text('Add Celling'),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              cellingList.add(Ceiling());
            });
          },
        ),
      ],
    );
  }

  List<Form> createCellingForm() => cellingList
      .asMap()
      .keys
      .map(
        (cellingIndex) => Form(
          key: formKeys[cellingIndex],
          onChanged: () {
            debounceEvent(() {
              formKeys[cellingIndex].currentState.save();
              widget.onDataChanged(cellingList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Ceiling ${cellingIndex + 1}'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText(
                  'Checklist',
                ),
              ),
              ...[
                'Painting',
                'Plastering',
                'False Ceiling',
                'Mason Problems',
              ]
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
                              cellingList[cellingIndex].paintingCondition =
                                  value;
                            });
                            widget.onDataChanged(cellingList);
                            break;
                          case 'Plastering':
                            setState(() {
                              cellingList[cellingIndex].plasteringCondition =
                                  value;
                            });
                            widget.onDataChanged(cellingList);
                            break;
                          case 'False Ceiling':
                            setState(() {
                              cellingList[cellingIndex].falseCeilingsCondition =
                                  value;
                            });
                            widget.onDataChanged(cellingList);
                            break;
                          case 'Mason Problems':
                            setState(() {
                              cellingList[cellingIndex].masonProblemCondition =
                                  value;
                            });
                            widget.onDataChanged(cellingList);
                            break;
                          default:
                        }
                      },
                      value: getCheckListConditionValue(item, cellingIndex),
                    ),
                  )
                  .toList(),
              ...cellingList[cellingIndex]
                  .otherProblemCondition
                  .asMap()
                  .keys
                  .map((otherProbelmIndex) {
                MinorChecksCondition problemCondition =
                    cellingList[cellingIndex]
                        .otherProblemCondition[otherProbelmIndex];
                return InspectionMinorChecksCondition(
                  title: SubHeadingText(
                    problemCondition.otherFixtureName,
                    subHeading: SubHeading.sub2,
                  ),
                  onDataChanged: (value) {
                    setState(() {
                      cellingList[cellingIndex]
                          .otherProblemCondition[otherProbelmIndex] = value;
                    });
                    widget.onDataChanged(cellingList);
                  },
                  value: problemCondition,
                );
              }).toList(),
              AddElementButton(
                title: Text('Celling ${cellingIndex + 1} - Add Other Problem'),
                onTap: () {
                  buildAddOtherProblemDialog(context, Text('Other Problem'))
                      .then((problem) {
                    if (problem != null) {
                      setState(() {
                        cellingList[cellingIndex]
                            .otherProblemCondition
                            .add(problem);
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

  getCheckListConditionValue(String checkListItem, int doorIndex) {
    switch (checkListItem) {
      case 'Painting':
        return cellingList[doorIndex].paintingCondition;
        break;
      case 'Plastering':
        return cellingList[doorIndex].plasteringCondition;
        break;
      case 'False Ceiling':
        return cellingList[doorIndex].falseCeilingsCondition;
        break;
      case 'Mason Problems':
        return cellingList[doorIndex].masonProblemCondition;
        break;
      default:
    }
  }
}
