import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/minor_checks/minor_checks.dart';

part 'door_view.dart';
part 'window_view.dart';
part 'celling_view.dart';
part 'walls_view.dart';
part 'electrical_fitting_view.dart';
part 'pest_inspection_view.dart';
part 'carpentry_view.dart';
part 'metal_alumunium_works_view.dart';
part 'cleaning_view.dart';

class MinorChecksForm extends StatelessWidget {
  const MinorChecksForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Door',
                ),
                Tab(
                  text: 'Window',
                ),
                Tab(
                  text: 'Celling',
                ),
                Tab(
                  text: 'Walls',
                ),
                Tab(
                  text: 'Electrical Fittings',
                ),
                Tab(
                  text: 'Pest Inspection',
                ),
                Tab(
                  text: 'Carpentry',
                ),
                Tab(
                  text: 'Metal and Alumunium Works',
                ),
                Tab(
                  text: 'Cleaning',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                DoorView(),
                WindowView(),
                CellingView(),
                WallsView(),
                ElectricalFittingView(),
                PestInspectionView(),
                CarpentryView(),
                MetalAndAlumuniumWorksView(),
                CleaningView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
