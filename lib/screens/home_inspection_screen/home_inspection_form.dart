part of 'home_inspection_screen.dart';

class HomeInspectionForm extends StatefulWidget {
  HomeInspectionForm({Key key}) : super(key: key);

  @override
  _HomeInspectionFormState createState() => _HomeInspectionFormState();
}

class _HomeInspectionFormState extends State<HomeInspectionForm> {
  TextEditingController _materialTextFieldController =
      TextEditingController(text: '');
  InspectionData _inspectionData = InspectionData();
  Building _building = Building();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appBarImage = FlexibleSpaceBar(
      background: _building.photo != null
          ? Image.file(
              File(_building.photo),
              fit: BoxFit.cover,
            )
          : null,
    );
    var appBarFAB = FloatingActionButton(
      child: Icon(Icons.camera_enhance),
      onPressed: () {
        buildShowModalBottomSheet(context);
      },
    );
    var appBar = SliverAppBar(
      expandedHeight: 300.0,
      title: Text(
        'Home Inspection Form',
      ),
      centerTitle: true,
      floating: true,
      flexibleSpace: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          appBarImage,
          Positioned(
            bottom: -30,
            right: 16.0,
            child: SizedBox.fromSize(
              size: Size(60.0, 60.0),
              child: appBarFAB,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBar,
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0 * 2),
                  child: Form(
                    key: formKey,
                    onChanged: () {
                      debounceEvent(() {
                        formKey.currentState.save();
                        _inspectionData.buildingData = _building;
                        print(_inspectionData.toJson());
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Client Detail'),
                        ),
                        AppInputTextField(
                          labelText: 'Client Name',
                          onSaved: (value) {
                            _inspectionData.name = value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Address',
                          onSaved: (value) {
                            _inspectionData.address = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Building Deatils'),
                        ),
                        AppInputTextField(
                          labelText: 'No. of Storey',
                          keyboardType: TextInputType.number,
                          initialValue: '0',
                          onSaved: (value) {
                            _building.storeyNo = int.parse(value);
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Original Purpose of Building',
                          onSaved: (value) {
                            _building.originalPurpose = value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Current Purpose of Building',
                          onSaved: (value) {
                            _building.currentPurpose = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText(
                            'Area of Building',
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: AppInputTextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Length',
                                initialValue: '0',
                                onSaved: (value) {
                                  _building.length = double.parse(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: AppInputTextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Breath',
                                initialValue: '0',
                                onSaved: (value) {
                                  _building.length = double.parse(value);
                                },
                              ),
                            ),
                            Expanded(
                              child: AppInputTextField(
                                enabled: false,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Area',
                              ),
                            ),
                          ],
                        ),
                        CubitBuilder<StructuralSystemCubit,
                            StructuralSystemState>(
                          builder: (context, state) {
                            List<StructuralSystem> data;
                            if (state is StructuralSystemSuccess) {
                              data = [...state.structuralSystem]
                                ..add(StructuralSystem(
                                  id: 0,
                                  isEditable: 0,
                                  systemName: 'Other',
                                ));
                            } else {
                              data = [];
                            }
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: AppDropdownMenu<StructuralSystem>(
                                title: 'Structural System of Building',
                                value: _building?.structuralSystem?.id == 0
                                    ? data.last
                                    : _building?.structuralSystem ?? null,
                                onChanged: (value) {
                                  setState(() {
                                    _building?.structuralSystem = value;
                                  });
                                },
                                items: data
                                    .map((item) => DropdownMenuItem(
                                          child: Text(item.systemName),
                                          value: item,
                                        ))
                                    .toList(),
                              ),
                            );
                          },
                        ),
                        AppInputTextField(
                          enabled:
                              _building?.structuralSystem?.id == 0 ?? false,
                          labelText: 'Other Structural System of Building',
                          onSaved: (value) {
                            if (_building?.structuralSystem?.id == 0)
                              setState(() {
                                _building.structuralSystem = StructuralSystem(
                                  id: 0,
                                  systemName: value,
                                  isEditable: 0,
                                );
                              });
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Materials Used'),
                        ),
                        ...createMaterialUsedWidgets(),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text('Add Materials Used'),
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Material Used'),
                                  content: TextField(
                                    controller: _materialTextFieldController,
                                    autofocus: true,
                                  ),
                                  actions: <Widget>[
                                    RaisedButton(
                                      color: Theme.of(context).primaryColor,
                                      child: Text('Add'),
                                      onPressed: () {
                                        Navigator.of(context).pop(
                                            _materialTextFieldController
                                                .value.text);
                                      },
                                    )
                                  ],
                                );
                              },
                            ).then((value) {
                              _materialTextFieldController.clear();
                              if (value != null)
                                setState(() {
                                  _building.materialUsed.add(value);
                                });
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Soil/Foundation Condition of Building',
                          onSaved: (value) {
                            _building.foundationCondition = value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Supervision Status',
                          onSaved: (value) {
                            _building.supervisionStatus = value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Comment',
                          onSaved: (value) {
                            _building.comment = value;
                          },
                        ),
                        CubitBuilder<InspectionCauseCubit,
                            InspectionCauseState>(
                          builder: (context, state) {
                            List<InspectionCause> data;
                            if (state is InspectionCauseSuccess) {
                              data = state.inspectionCause;
                            } else {
                              data = [];
                            }
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: AppDropdownMenu<InspectionCause>(
                                title: 'Cause of Inspection',
                                value: _building.inspectionCause ?? null,
                                onChanged: (value) {
                                  setState(() {
                                    _building.inspectionCause = value;
                                  });
                                },
                                items: data
                                    .map((item) => DropdownMenuItem(
                                          child: Text(item.inspectionCause),
                                          value: item,
                                        ))
                                    .toList(),
                              ),
                            );
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Comment on Existing Problems',
                          onSaved: (value) {
                            _building.problemComment = value;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Rooms'),
                        ),
                        ...createBuildingRooms(),
                        InkWell(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text('Add New Room'),
                                ),
                                Icon(
                                  Icons.add_circle,
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed('/roomFrom',
                                arguments: 'F2 - Kitchen');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future buildShowModalBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return ImagePickerBottomSheet(
          onImage: (image) {
            setState(() {
              _building.photo = image;
            });
          },
        );
      },
    );
  }

  List<Widget> createMaterialUsedWidgets() => _building.materialUsed
      .map(
        (item) => ListTile(
          title: Text(item),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.edit),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text('Edit'),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
      .toList();

  List<Widget> createBuildingRooms() {
    _building.rooms.sort((a, b) => a.storeyNo.compareTo(b.storeyNo));

    return _building.rooms
        .map(
          (item) => ListTile(
            title: Text(item.roomPurpose.purpose),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
