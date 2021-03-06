import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/components/image_picker_bottomsheet.dart';
import 'package:house_review/cubit/home_inspection_cubit/home_inspection_cubit.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/room.dart';
import './forms/forms.dart';

class RoomInspectionScreen extends StatefulWidget {
  final String title;
  RoomInspectionScreen({Key key, this.title}) : super(key: key);

  @override
  _RoomInspectionScreenState createState() => _RoomInspectionScreenState();
}

class _RoomInspectionScreenState extends State<RoomInspectionScreen> {
  Room room = Room();
  InspectionData inspectionData;
  int index;
  @override
  void didChangeDependencies() {
    inspectionData = (ModalRoute.of(context).settings.arguments
        as Map<String, dynamic>)['inspectionData'];
    index = (ModalRoute.of(context).settings.arguments
        as Map<String, dynamic>)['roomIndex'];
    room = inspectionData.buildingData.rooms[index];
  }

  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 300.0,
      title: Text(
        '${room.storeyNo}/${room.roomNo}/${room.roomPurpose.purpose}',
      ),
      centerTitle: true,
      floating: true,
      pinned: true,
      bottom: PreferredSize(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Structural Inspection',
              ),
              Tab(
                text: 'Water Quality',
              ),
              Tab(
                text: 'Luxmeter Reading',
              ),
              Tab(
                text: 'Seepage Analysis',
              ),
              Tab(
                text: 'Minor Checks',
              ),
              Tab(
                text: 'Kitchen Inspection',
              ),
              Tab(
                text: 'Toilet Inspection',
              ),
              Tab(
                text: 'Staircase Inspection',
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            room.pictures.length == 0
                ? Container()
                : Image.file(
                    File(room.pictures[0]),
                    fit: BoxFit.cover,
                  ),
            Positioned(
              bottom: 60.0,
              right: 16.0,
              child: SizedBox.fromSize(
                size: Size(60.0, 60.0),
                child: FloatingActionButton(
                  child: Icon(Icons.camera_enhance),
                  onPressed: () {
                    showImagePickerBottomSheet(
                      context,
                      onImage: (path) {
                        setState(() {
                          room.pictures.add(path);
                        });
                        saveData(context);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return CubitListener<HomeInspectionCubit, HomeInspectionState>(
      listener: (context, state) {
        if (state is HomeInspectionSuccess) {
          inspectionData = state.inspectionData;
          room = inspectionData.buildingData.rooms[index];
        }
      },
      child: DefaultTabController(
        length: 8,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [appBar];
          },
          body: Material(
            child: TabBarView(
              children: <Widget>[
                StructuralInspectionForm(
                  value: room.structuralInspection,
                  onDataChanged: (value) {
                    room.structuralInspection = value;
                    saveData(context);
                  },
                ),
                WaterQualityForm(
                  value: room.waterQualities,
                  onDataChanged: (value) {
                    room.waterQualities = value;
                    saveData(context);
                  },
                ),
                LuxmeterReadingForm(
                  value: room.luxmeterReadings,
                  onDataChanged: (value) {
                    room.luxmeterReadings = value;
                    saveData(context);
                  },
                ),
                SeepageAnalysisFrom(
                  value: room.seepageAnalysis,
                  onDataChanged: (value) {
                    room.seepageAnalysis = value;
                    saveData(context);
                  },
                ),
                MinorChecksForm(
                  value: room.minorChecks,
                  onDataChanged: (value) {
                    room.minorChecks = value;
                    saveData(context);
                  },
                ),
                KitchenInspectionForm(
                  value: room.kitchenInspection,
                  onDataChanged: (value) {
                    room.kitchenInspection = value;
                    saveData(context);
                  },
                ),
                ToiletInspectionForm(
                  value: room.toiletInspection,
                  onDateChanged: (value) {
                    room.toiletInspection = value;
                    saveData(context);
                  },
                ),
                StaircaseInspectionForm(
                  value: room.staircaseInspection,
                  onDataChanged: (value) {
                    room.staircaseInspection = value;
                    saveData(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveData(BuildContext context) {
    context.cubit<HomeInspectionCubit>().editData(
        (context.cubit<HomeInspectionCubit>().state as HomeInspectionSuccess)
            .inspectionDataFile
            .path
            .split('/')
            .last,
        inspectionData);
  }
}
