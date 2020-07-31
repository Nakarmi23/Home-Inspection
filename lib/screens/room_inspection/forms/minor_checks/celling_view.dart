part of './minor_checks_form.dart';

class CellingView extends StatefulWidget {
  const CellingView({Key key, @required this.onDataChanged})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<Ceiling>> onDataChanged;
  @override
  _CellingViewState createState() => _CellingViewState();
}

class _CellingViewState extends State<CellingView> {
  List<Ceiling> cellingList = [Ceiling()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createCellingForm(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Celling'),
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
                'Other Problems'
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
                          case 'Other Problems':
                            setState(() {
                              cellingList[cellingIndex].otherProblemCondition =
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
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InspectionImageComment(
                  images: cellingList[cellingIndex].photos,
                  comment: cellingList[cellingIndex].comment,
                  onCommentSaved: (value) {
                    cellingList[cellingIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      cellingList[cellingIndex].photos.add(path);
                    });
                    widget.onDataChanged(cellingList);
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
      case 'Other Problems':
        return cellingList[doorIndex].otherProblemCondition;
        break;
      default:
    }
  }
}
