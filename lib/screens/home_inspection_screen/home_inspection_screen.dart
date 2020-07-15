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
import 'package:house_review/models/structural_system.dart';

class HomeInspectionScreen extends StatefulWidget {
  HomeInspectionScreen({Key key}) : super(key: key);

  @override
  _HomeInspectionScreenState createState() => _HomeInspectionScreenState();
}

class _HomeInspectionScreenState extends State<HomeInspectionScreen> {
  String imageFile;
  int selectedStructuralSystem;
  int selectedInspectionCause;
  List<String> materialUsed = ["Sand"];
  List<String> buildingRooms = ["Bedroom"];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    // _bloc.dispose();
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
            background: imageFile != null
                ? Image.file(
                    File(imageFile),
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
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );
    var inputFieldSpacer = SizedBox.fromSize(
      size: Size.fromHeight(16),
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
                        ),
                        AppInputTextField(
                          labelText: 'Address',
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText('Building Deatils'),
                        ),
                        AppInputTextField(
                          labelText: 'No. of Storey',
                        ),
                        AppInputTextField(
                          labelText: 'Original Purpose of Building',
                        ),
                        AppInputTextField(
                          labelText: 'Current Purpose of Building',
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 16.0, right: 16.0),
                          child: HeadingText(
                            'Area of Building',
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: AppInputTextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Length',
                              ),
                            ),
                            SizedBox.fromSize(
                              size: Size(8.0, 0),
                            ),
                            Expanded(
                              child: AppInputTextField(
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                labelText: 'Breath',
                              ),
                            ),
                            SizedBox.fromSize(
                              size: Size(8.0, 0),
                            ),
                            Text('='),
                            SizedBox.fromSize(
                              size: Size(8.0, 0),
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
                              data = state.structuralSystem
                                ..add(StructuralSystem(
                                    id: 0, systemName: 'Other'));
                            } else {
                              data = [];
                            }
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: AppDropdownMenu(
                                title: 'Structural System of Building',
                                value: selectedStructuralSystem,
                                onChanged: (value) {
                                  setState(() {
                                    selectedStructuralSystem = value;
                                  });
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
                          enabled: selectedStructuralSystem == 0,
                          labelText: 'Other Structural System of Building',
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
                          onTap: () {},
                        ),
                        AppInputTextField(
                          labelText: 'Soil/Foundation Condition of Building',
                        ),
                        AppInputTextField(
                          labelText: 'Supervision Status',
                        ),
                        AppInputTextField(
                          labelText: 'Comment',
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
                              child: AppDropdownMenu(
                                title: 'Cause of Inspection',
                                value: selectedInspectionCause,
                                onChanged: (value) {
                                  setState(() {
                                    selectedInspectionCause = value;
                                  });
                                },
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
                          labelText: 'Comment on Existing Problems',
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
              imageFile = image;
            });
          },
        );
      },
    );
  }

  List<Widget> createMaterialUsedWidgets() => materialUsed
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
