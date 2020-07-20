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

  @override
  Widget build(BuildContext context) {
    var appBarImage = FlexibleSpaceBar(
      background: _inspectionData.buildingData.photo != null
          ? Image.file(
              File(_inspectionData.buildingData.photo),
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
                    onChanged: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Client Deatils'),
                        ),
                        AppInputTextField(
                          labelText: 'Client Name',
                          onChanged: (value) {
                            debounceEvent(() {
                              _inspectionData.name = value;
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Address',
                          onChanged: (value) {
                            debounceEvent(() {
                              _inspectionData.address = value;
                            });
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
                          onChanged: (value) {
                            debounceEvent(() {
                              _inspectionData.buildingData.storeyNo =
                                  int.parse(value);
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Original Purpose of Building',
                          onChanged: (value) {
                            debounceEvent(() {
                              _inspectionData.buildingData.originalPurpose =
                                  value;
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Current Purpose of Building',
                          onChanged: (value) {
                            debounceEvent(() {
                              _inspectionData.buildingData.currentPurpose =
                                  value;
                            });
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
                                onChanged: (value) {
                                  debounceEvent(() {
                                    _inspectionData.buildingData.length =
                                        double.parse(value);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: AppInputTextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Breath',
                                onChanged: (value) {
                                  debounceEvent(() {
                                    _inspectionData.buildingData.length =
                                        double.parse(value);
                                  });
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
                                value: _inspectionData?.buildingData
                                            ?.structuralSystem?.id ==
                                        0
                                    ? data.last
                                    : _inspectionData
                                            .buildingData?.structuralSystem ??
                                        null,
                                onChanged: (value) {
                                  setState(() {
                                    _inspectionData
                                        .buildingData?.structuralSystem = value;
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
                          enabled: _inspectionData
                                      ?.buildingData?.structuralSystem?.id ==
                                  0 ??
                              false,
                          labelText: 'Other Structural System of Building',
                          onChanged: (value) {
                            debounceEvent(() {
                              setState(() {
                                _inspectionData.buildingData.structuralSystem =
                                    StructuralSystem(
                                  id: 0,
                                  systemName: value,
                                  isEditable: 0,
                                );
                              });
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
                                  _inspectionData.buildingData.materialUsed
                                      .add(value);
                                });
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Soil/Foundation Condition of Building',
                          onChanged: (value) {
                            _inspectionData.buildingData.foundationCondition =
                                value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Supervision Status',
                          onChanged: (value) {
                            _inspectionData.buildingData.supervisionStatus =
                                value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Comment',
                          onChanged: (value) {
                            _inspectionData.buildingData.comment = value;
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
                                value: _inspectionData
                                        .buildingData.inspectionCause ??
                                    null,
                                onChanged: (value) {
                                  setState(() {
                                    _inspectionData
                                        .buildingData.inspectionCause = value;
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
                          onChanged: (value) {
                            _inspectionData.buildingData.problemComment = value;
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
              _inspectionData.buildingData.photo = image;
            });
          },
        );
      },
    );
  }

  List<Widget> createMaterialUsedWidgets() =>
      _inspectionData.buildingData.materialUsed
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
    _inspectionData.buildingData.rooms
        .sort((a, b) => a.storeyNo.compareTo(b.storeyNo));

    return _inspectionData.buildingData.rooms
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
