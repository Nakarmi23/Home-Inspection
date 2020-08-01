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
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Wall'),
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
              ...['Painting', 'Plastering', 'Mason Problems', 'Other Problems']
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
                          case 'Other Problems':
                            setState(() {
                              wallList[wallIndex].otherProblemCondition = value;
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
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: InspectionImageComment(
                  images: wallList[wallIndex].photos,
                  comment: wallList[wallIndex].comment,
                  onCommentSaved: (value) {
                    wallList[wallIndex].comment = value;
                  },
                  onImageAdd: (path) {
                    setState(() {
                      wallList[wallIndex].photos.add(path);
                    });
                    widget.onDataChanged(wallList);
                  },
                  onImageTap: (index) {},
                ),
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
      case 'Other Problems':
        return wallList[wallIndex].otherProblemCondition;
        break;
      default:
    }
  }
}
