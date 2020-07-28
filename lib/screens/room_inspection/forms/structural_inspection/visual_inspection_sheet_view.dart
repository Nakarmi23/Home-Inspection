part of './structural_inspection_form.dart';

typedef VisualInspectionSheetOnSave = Function(VisualInspection value);

class VisualInspectionSheetView extends StatefulWidget {
  const VisualInspectionSheetView({Key key, @required this.onFormSave})
      : super(key: key);
  final VisualInspectionSheetOnSave onFormSave;

  @override
  _VisualInspectionSheetViewState createState() =>
      _VisualInspectionSheetViewState();
}

class _VisualInspectionSheetViewState extends State<VisualInspectionSheetView> {
  VisualInspection visualInspection = VisualInspection();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: () {
        debounceEvent(() {
          _formKey.currentState.save();
          widget.onFormSave(visualInspection);
        });
      },
      child: CustomListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: HeadingText('Visual Inspection Sheet'),
          ),
          AppInputTextField(
            labelText: 'Location of Visual Inspection',
            validator: (value) {
              switch (value) {
                case '':
                  return 'Location of Visual Inspection cannot be empty';
                default:
              }
            },
            onSaved: (value) {
              visualInspection.location = value;
            },
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingText(
              'Spalling',
            ),
          ),
          InspectionImageComment(
            images: visualInspection.spalling.photos,
            comment: visualInspection.spalling.comment,
            onCommentSaved: (value) {
              visualInspection.spalling.comment = value;
            },
            onImageAdd: (path) {
              setState(() {
                visualInspection.spalling.photos.add(path);
              });
              widget.onFormSave(visualInspection);
            },
            onImageTap: (index) {},
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingText(
              'Cracking',
            ),
          ),
          InspectionImageComment(
            images: visualInspection.cracking.photos,
            comment: visualInspection.cracking.comment,
            onCommentSaved: (value) {
              visualInspection.cracking.comment = value;
            },
            onImageAdd: (path) {
              setState(() {
                visualInspection.cracking.photos.add(path);
              });
              widget.onFormSave(visualInspection);
            },
            onImageTap: (index) {},
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Cracking - Verneir Reading',
              subHeading: SubHeading.sub2,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: AppInputTextField(
                  labelText: 'Depth',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    switch (value) {
                      case '':
                        return 'Cannot be empty';
                      case '0':
                        return 'Cannot be 0';
                      default:
                    }
                  },
                  onSaved: (newValue) {
                    visualInspection.cracking.depth = double.tryParse(newValue);
                  },
                ),
              ),
              Expanded(
                child: AppInputTextField(
                  labelText: 'Width',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    switch (value) {
                      case '':
                        return 'Cannot be empty';
                      case '0':
                        return 'Cannot be 0';
                      default:
                    }
                  },
                  onSaved: (newValue) {
                    visualInspection.cracking.width = double.tryParse(newValue);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingText(
              'Bulging',
            ),
          ),
          InspectionImageComment(
            images: visualInspection.bulging.photos,
            comment: visualInspection.bulging.comment,
            onCommentSaved: (value) {
              visualInspection.bulging.comment = value;
            },
            onImageAdd: (path) {
              setState(() {
                visualInspection.bulging.photos.add(path);
              });
              widget.onFormSave(visualInspection);
            },
            onImageTap: (index) {},
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Bulging - Verneir Reading',
              subHeading: SubHeading.sub2,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: AppInputTextField(
                  labelText: 'Depth',
                  validator: (value) {
                    switch (value) {
                      case '':
                        return 'Cannot be empty';
                      case '0':
                        return 'Cannot be 0';
                      default:
                    }
                  },
                  onSaved: (newValue) {
                    visualInspection.bulging.depth = double.tryParse(newValue);
                  },
                ),
              ),
              Expanded(
                child: AppInputTextField(
                  labelText: 'Width',
                  validator: (value) {
                    switch (value) {
                      case '':
                        return 'Cannot be empty';
                      case '0':
                        return 'Cannot be 0';
                      default:
                    }
                  },
                  onSaved: (newValue) {
                    visualInspection.bulging.depth = double.tryParse(newValue);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SubHeadingText(
              'Tilting',
            ),
          ),
          InspectionImageComment(
            images: visualInspection.tilting.photos,
            comment: visualInspection.tilting.comment,
            onCommentSaved: (value) {
              visualInspection.tilting.comment = value;
            },
            onImageAdd: (path) {
              setState(() {
                visualInspection.tilting.photos.add(path);
              });
            },
            onImageTap: (index) {},
          ),
          AppInputTextField(
            labelText: 'Tilting Reading',
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Tilting - Photo using Digital Level Meter',
              subHeading: SubHeading.sub2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SizedBox(
              height: 80,
              child: ImageListViewBuilder(
                onImageAdd: (path) {
                  setState(() {
                    visualInspection.tilting.digitalLevelMeterPhotos.add(path);
                  });
                  widget.onFormSave(visualInspection);
                },
                onImageTap: (index) {},
                images: visualInspection.tilting.digitalLevelMeterPhotos,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: SubHeadingText(
              'Other Problems',
            ),
          ),
          ...createOtherProblems(),
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('Add Other Problems'),
                  ),
                  Icon(
                    Icons.add_circle,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
            onTap: () {
              buildAddOtherProblemDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future buildAddOtherProblemDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Other Problem'),
          children: <Widget>[
            AddOtherProblemsForm(
              onFormSave: (problem) {
                setState(() {
                  visualInspection.otherProblems.add(problem);
                });
                widget.onFormSave(visualInspection);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  createOtherProblems() => visualInspection.otherProblems.map(
        (item) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: SubHeadingText(
                  item.name,
                  subHeading: SubHeading.sub2,
                ),
                trailing:
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ),
              InspectionImageComment(
                images: item.photos,
                comment: item.comment,
                onCommentSaved: (newValue) {
                  item.comment = newValue;
                },
                onImageAdd: (path) {
                  setState(() {
                    item.photos.add(path);
                  });
                  widget.onFormSave(visualInspection);
                },
                onImageTap: (index) {},
              )
            ],
          );
        },
      ).toList();
}
