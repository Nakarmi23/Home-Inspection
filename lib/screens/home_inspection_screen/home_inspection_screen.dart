import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/components/app_dropdown_menu.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_picker_bottomsheet.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';
import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/structural_system.dart';
import 'package:house_review/utility/debounce.dart';

class HomeInspectionScreen extends StatefulWidget {
  HomeInspectionScreen({Key key}) : super(key: key);

  @override
  _HomeInspectionScreenState createState() => _HomeInspectionScreenState();
}

class _HomeInspectionScreenState extends State<HomeInspectionScreen> {
  String imageFile;
  StructuralSystem selectedStructuralSystem;
  int selectedInspectionCause;
  List<String> materialUsed = ["Sand"];
  List<String> buildingRooms = ["Bedroom"];
  TextEditingController _materialTextFieldController =
      TextEditingController(text: '');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  InspectionData _inspectionData =
      InspectionData(dateOfInspection: DateTime.now());
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _formKey.currentState.
  }

  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 300.0,
      title: Text(
        'Home Inspection Form',
      ),
      centerTitle: true,
      floating: true,
      pinned: false,
      flexibleSpace: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          FlexibleSpaceBar(
            background: _inspectionData.buildingData.photo != null
                ? Image.file(
                    File(_inspectionData.buildingData.photo),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          Positioned(
            bottom: -30,
            right: 16.0,
            child: SizedBox.fromSize(
              size: Size(60.0, 60.0),
              child: FloatingActionButton(
                child: Icon(Icons.camera_enhance),
                onPressed: () {
                  buildShowModalBottomSheet(context);
                },
              ),
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
                    key: _formKey,
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
                          onChange: (value) {
                            debounceEvent(() {
                              _inspectionData.name = value;
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Address',
                          onChange: (value) {
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
                          onChange: (value) {
                            debounceEvent(() {
                              _inspectionData.buildingData.storeyNo =
                                  int.parse(value);
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Original Purpose of Building',
                          onChange: (value) {
                            debounceEvent(() {
                              _inspectionData.buildingData.originalPurpose =
                                  value;
                            });
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Current Purpose of Building',
                          onChange: (value) {
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
                                onChange: (value) {
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
                                onChange: (value) {
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
                          onChange: (value) {
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
                          onChange: (value) {
                            _inspectionData.buildingData.foundationCondition =
                                value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Supervision Status',
                          onChange: (value) {
                            _inspectionData.buildingData.supervisionStatus =
                                value;
                          },
                        ),
                        AppInputTextField(
                          labelText: 'Comment',
                          onChange: (value) {
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
                          onChange: (value) {
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

  List<Widget> createBuildingRooms() => buildingRooms
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
}
