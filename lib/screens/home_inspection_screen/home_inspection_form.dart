part of 'home_inspection_screen.dart';

class HomeInspectionForm extends StatefulWidget {
  HomeInspectionForm({Key key}) : super(key: key);

  @override
  _HomeInspectionFormState createState() => _HomeInspectionFormState();
}

class _HomeInspectionFormState extends State<HomeInspectionForm> {
  InspectionData _inspectionData = InspectionData();
  Building _building = Building(
    storeyNo: 1,
  );
  bool isEditing = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isEditing = ModalRoute.of(context).settings.arguments ?? false;
    if (isEditing) {
      _inspectionData =
          (context.cubit<HomeInspectionCubit>().state as HomeInspectionSuccess)
              .inspectionData;
      _building = _inspectionData.buildingData;
    }
  }

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
        showPickImageOptionBottomSheet(context);
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

    return CubitListener<HomeInspectionCubit, HomeInspectionState>(
      listener: (context, state) {
        if (state is HomeInspectionSuccess) {
          if (isEditing == false) {
            context.cubit<InspectionFileInfoCubit>().saveData(
                InspectionFileInfo(
                    address: state.inspectionData.address,
                    name: state.inspectionData.name,
                    fileName: state.inspectionDataFile.path.split('/').last,
                    path: state.inspectionDataFile.path));
          }
          isEditing = true;
        }
      },
      child: Scaffold(
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
                        onFormChanged(context,
                            context.cubit<HomeInspectionCubit>().state);
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
                            initialValue: _inspectionData.name,
                            labelText: 'Client Name',
                            onSaved: (value) {
                              setState(() {
                                _inspectionData.name = value;
                              });
                            },
                          ),
                          AppInputTextField(
                            initialValue: _inspectionData.address,
                            labelText: 'Address',
                            onSaved: (value) {
                              setState(() {
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
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
                            labelText: 'No. of Storey',
                            keyboardType: TextInputType.number,
                            initialValue: _building.storeyNo?.toString() ?? '1',
                            onSaved: (value) {
                              _building.storeyNo =
                                  value.isNotEmpty ? int.parse(value) : 1;
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.originalPurpose,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
                            labelText: 'Original Purpose of Building',
                            onSaved: (value) {
                              _building.originalPurpose = value;
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.currentPurpose,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
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
                                  enabled:
                                      (_inspectionData.address?.isNotEmpty ??
                                              false) &&
                                          (_inspectionData.name?.isNotEmpty ??
                                              false),
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  labelText: 'Length',
                                  initialValue:
                                      _building.length?.toString() ?? '0',
                                  onSaved: (value) {
                                    _building.length = double.parse(value);
                                  },
                                ),
                              ),
                              Expanded(
                                child: AppInputTextField(
                                  enabled:
                                      (_inspectionData.address?.isNotEmpty ??
                                              false) &&
                                          (_inspectionData.name?.isNotEmpty ??
                                              false),
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  labelText: 'Breath',
                                  initialValue:
                                      _building.breath?.toString() ?? '0',
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
                            builder: (context, structuralSystemstate) {
                              List<StructuralSystem> data;
                              if (structuralSystemstate
                                  is StructuralSystemSuccess) {
                                data = [
                                  ...structuralSystemstate.structuralSystem
                                ]..add(StructuralSystem(
                                    id: 0,
                                    isEditable: 0,
                                    systemName: 'Other',
                                  ));
                              } else {
                                data = [];
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: AppDropdownMenu<int>(
                                  title: 'Structural System of Building',
                                  value: (_building?.structuralSystem?.id == 0)
                                      ? data.last.id
                                      : _building?.structuralSystem?.id ?? null,
                                  onChanged: (value) {
                                    setState(() {
                                      _building?.structuralSystem = data
                                          .where(
                                              (element) => element.id == value)
                                          .toList()[0];
                                    });
                                    onFormChanged(
                                        context,
                                        context
                                            .cubit<HomeInspectionCubit>()
                                            .state);
                                  },
                                  items: data
                                      .map((item) => DropdownMenuItem(
                                            child: Text(item.systemName),
                                            value: item.id,
                                          ))
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.structuralSystem?.id == 0
                                ? _building.structuralSystem.systemName
                                : null,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            onTap: (_inspectionData.address?.isNotEmpty ??
                                        false) &&
                                    (_inspectionData.name?.isNotEmpty ?? false)
                                ? () async {
                                    await showAddMaterialDialog(context);

                                    onFormChanged(
                                        context,
                                        context
                                            .cubit<HomeInspectionCubit>()
                                            .state);
                                  }
                                : null,
                          ),
                          AppInputTextField(
                            initialValue: _building.foundationCondition,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
                            labelText: 'Soil/Foundation Condition of Building',
                            onSaved: (value) {
                              _building.foundationCondition = value;
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.supervisionStatus,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
                            labelText: 'Supervision Status',
                            onSaved: (value) {
                              _building.supervisionStatus = value;
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.comment,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
                            labelText: 'Comment',
                            onSaved: (value) {
                              _building.comment = value;
                            },
                          ),
                          CubitBuilder<InspectionCauseCubit,
                              InspectionCauseState>(
                            builder: (context, causeOfInspectionState) {
                              List<InspectionCause> data;
                              if (causeOfInspectionState
                                  is InspectionCauseSuccess) {
                                data = causeOfInspectionState.inspectionCause;
                              } else {
                                data = [];
                              }
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: AppDropdownMenu<int>(
                                  title: 'Cause of Inspection',
                                  value: _building?.inspectionCause?.id ?? null,
                                  onChanged: (_inspectionData
                                                  .address?.isNotEmpty ??
                                              false) &&
                                          (_inspectionData.name?.isNotEmpty ??
                                              false)
                                      ? (value) {
                                          setState(() {
                                            _building.inspectionCause = data
                                                .where((element) =>
                                                    element.id == value)
                                                .toList()[0];
                                          });
                                          onFormChanged(
                                              context,
                                              context
                                                  .cubit<HomeInspectionCubit>()
                                                  .state);
                                        }
                                      : null,
                                  items: data
                                      .map((item) => DropdownMenuItem(
                                            child: Text(item.inspectionCause),
                                            value: item.id,
                                          ))
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          AppInputTextField(
                            initialValue: _building.problemComment,
                            enabled: (_inspectionData.address?.isNotEmpty ??
                                    false) &&
                                (_inspectionData.name?.isNotEmpty ?? false),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            onTap: (_inspectionData.address?.isNotEmpty ??
                                        false) &&
                                    (_inspectionData.name?.isNotEmpty ?? false)
                                ? () async {
                                    await showAddRoom(context);

                                    onFormChanged(
                                        context,
                                        context
                                            .cubit<HomeInspectionCubit>()
                                            .state);
                                    Navigator.of(context)
                                        .pushNamed('/roomFrom', arguments: {
                                      'inspectionData': _inspectionData,
                                      'roomIndex': _building.rooms.length - 1,
                                    });
                                  }
                                : null,
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
      ),
    );
  }

  Future showAddRoom(BuildContext context, [int index]) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Room Detail'),
          children: <Widget>[
            RoomDetailModelForm(
              buildingStorey: _building.storeyNo,
              onFormSave: (value) {
                if (index == null) {
                  this.setState(() {
                    _building.rooms.add(value);
                  });
                  Navigator.of(context).pop();
                } else {
                  this.setState(() {
                    _building.rooms[index] = value;
                  });
                  Navigator.of(context).pop();
                }
              },
              toEditValue: index != null ? _building.rooms[index] : null,
            ),
          ],
        );
      },
    );
  }

  Future showAddMaterialDialog(BuildContext context, [int index]) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Material Used'),
          children: <Widget>[
            MaterialModelForm(
              toEditValue: index != null ? _building.materialUsed[index] : null,
              onFormSave: (value) {
                setState(() {
                  if (index != null) {
                    _building.materialUsed[index] = value;
                  } else {
                    _building.materialUsed.add(value);
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onFormChanged(BuildContext context, HomeInspectionState state) {
    return debounceEvent(() {
      formKey.currentState.save();
      _inspectionData.buildingData = _building;
      if (isEditing == false) {
        if ((_inspectionData.name.isNotEmpty ?? false) &&
            (_inspectionData.address.isNotEmpty ?? false)) {
          context.cubit<HomeInspectionCubit>().saveData(_inspectionData);
        }
      } else {
        if (_inspectionData.name.isNotEmpty &&
            _inspectionData.address.isNotEmpty) {
          context.cubit<HomeInspectionCubit>().editData(
              (state as HomeInspectionSuccess)
                  .inspectionDataFile
                  .path
                  .split('/')
                  .last,
              _inspectionData);
        }
      }
    });
  }

  Future showPickImageOptionBottomSheet(BuildContext context) async {
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
        (item) => Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              _building.materialUsed
                  .removeAt(_building.materialUsed.indexOf(item));
            });
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              bool isUserSure = await deleteItemAlertModel(context);
              return isUserSure ?? false;
            } else if (direction == DismissDirection.startToEnd) {
              await showAddMaterialDialog(
                  context, _building.materialUsed.indexOf(item));
              return false;
            } else {
              return false;
            }
          },
          secondaryBackground: DismissibleBackground(
            color: Theme.of(context).errorColor,
            forDirection: DismissDirection.endToStart,
            child: Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          background: DismissibleBackground(
            color: Theme.of(context).accentColor,
            forDirection: DismissDirection.startToEnd,
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          child: ListTile(
            title: Text(item),
            trailing: PopupMenuButton(
              onSelected: (value) async {
                switch (value) {
                  case 0:
                    showAddMaterialDialog(
                        context, _building.materialUsed.indexOf(item));
                    break;
                  case 1:
                    bool isUserSure = await deleteItemAlertModel(context);
                    if (isUserSure)
                      setState(() {
                        _building.materialUsed.remove(item);
                      });
                    break;
                  default:
                }
              },
              itemBuilder: (context) => popupMenuButtonItems(),
            ),
          ),
        ),
      )
      .toList();

  List<Widget> createBuildingRooms() {
    _building.rooms.sort((a, b) => a.storeyNo.compareTo(b.storeyNo));

    return _building.rooms
        .asMap()
        .keys
        .map(
          (roomIndex) => Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                _building.rooms.removeAt(roomIndex);
              });
            },
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                bool isUserSure = await deleteItemAlertModel(context);
                return isUserSure ?? false;
              } else if (direction == DismissDirection.startToEnd) {
                await showAddRoom(context, roomIndex);
                return false;
              } else {
                return false;
              }
            },
            secondaryBackground: DismissibleBackground(
              color: Theme.of(context).errorColor,
              forDirection: DismissDirection.endToStart,
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            background: DismissibleBackground(
              color: Theme.of(context).accentColor,
              forDirection: DismissDirection.startToEnd,
              child: Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
            child: ListTile(
              title: Text(
                  '${_building.rooms[roomIndex].storeyNo}/${_building.rooms[roomIndex].roomNo}/${_building.rooms[roomIndex].roomPurpose.purpose}'),
              onTap: () {
                Navigator.of(context).pushNamed('/roomFrom', arguments: {
                  'index': roomIndex,
                  'building': _inspectionData
                });
              },
              trailing: PopupMenuButton(
                onSelected: (value) async {
                  switch (value) {
                    case 0:
                      showAddRoom(context, roomIndex);
                      break;
                    case 1:
                      bool isUserSure = await deleteItemAlertModel(context);
                      if (isUserSure)
                        setState(() {
                          _building.rooms.remove(roomIndex);
                        });
                      break;
                    default:
                  }
                },
                itemBuilder: (context) => popupMenuButtonItems(),
              ),
            ),
          ),
        )
        .toList();
  }

  List<PopupMenuItem<int>> popupMenuButtonItems() {
    return [
      PopupMenuItem<int>(
        value: 0,
        child: Row(
          children: <Widget>[
            Icon(Icons.edit),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('Edit'),
          ],
        ),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: Row(
          children: <Widget>[
            Icon(Icons.delete),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('Delete'),
          ],
        ),
      ),
    ];
  }

  Future<bool> deleteItemAlertModel(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Warning'),
          content:
              Text('Are you sure you want to delete this item from the list?'),
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Never Mind'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('I\'m Sure'),
              textColor: Theme.of(context).errorColor,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
