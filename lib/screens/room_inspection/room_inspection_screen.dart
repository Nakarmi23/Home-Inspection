import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';

part 'forms/structural_inspection_form.dart';
part 'forms/water_quality_form.dart';
part 'forms/luxmeter_reading_form.dart';
part 'forms/seepage_analysis_form.dart';
part 'forms/minor_checks_form.dart';
part 'forms/kitchen_inspection_form.dart';
part 'forms/toilet_inspection_form.dart';
part 'forms/staircase_inspection_form.dart';

class RoomInspectionScreen extends StatefulWidget {
  final String title;
  RoomInspectionScreen({Key key, this.title}) : super(key: key);

  @override
  _RoomInspectionScreenState createState() => _RoomInspectionScreenState();
}

class _RoomInspectionScreenState extends State<RoomInspectionScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar = SliverAppBar(
      expandedHeight: 300.0,
      title: Text(
        ModalRoute.of(context).settings.arguments,
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
            Image.network(
              'https://images.unsplash.com/photo-1565538810643-b5bdb714032a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 60.0,
              right: 16.0,
              child: SizedBox.fromSize(
                size: Size(60.0, 60.0),
                child: FloatingActionButton(
                  child: Icon(Icons.camera_enhance),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return DefaultTabController(
      length: 8,
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [appBar];
        },
        body: Material(
          child: TabBarView(
            children: <Widget>[
              StructuralInspectionForm(),
              WaterQualityForm(),
              LuxmeterReadingForm(),
              SeepageAnalysisFrom(),
              MinorChecksForm(),
              KitchenInspectionForm(),
              ToiletInspectionForm(),
              StaircaseInspectionForm(),
            ],
          ),
        ),
      ),
    );
  }
}
