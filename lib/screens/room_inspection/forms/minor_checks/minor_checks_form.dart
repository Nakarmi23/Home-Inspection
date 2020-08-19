import 'package:flutter/material.dart';
import 'package:house_review/components/add_element_button.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/minor_checks/minor_check_condition.dart';
import 'package:house_review/models/minor_checks/minor_checks.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/add_other_problem_form.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/inspection_minor_check_condition.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/minor_checks_form.dart';
import 'package:house_review/utility/debounce.dart';

part 'door_view.dart';
part 'window_view.dart';
part 'celling_view.dart';
part 'walls_view.dart';
part 'electrical_fitting_view.dart';
part 'pest_inspection_view.dart';

class MinorChecksForm extends StatelessWidget {
  const MinorChecksForm({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<MinorChecks> onDataChanged;
  final MinorChecks value;
  @override
  Widget build(BuildContext context) {
    MinorChecks minorChecks = value ?? MinorChecks();
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
                DoorView(
                  value: minorChecks.doors,
                  onDataChanged: (value) {
                    minorChecks.doors = value;
                    onDataChanged(minorChecks);
                  },
                ),
                WindowView(
                  value: minorChecks.window,
                  onDataChanged: (value) {
                    minorChecks.window = value;
                    onDataChanged(minorChecks);
                  },
                ),
                CellingView(
                  value: minorChecks.ceiling,
                  onDataChanged: (value) {
                    minorChecks.ceiling = value;
                    onDataChanged(minorChecks);
                  },
                ),
                WallsView(
                  value: minorChecks.wall,
                  onDataChanged: (value) {
                    minorChecks.wall = value;
                    onDataChanged(minorChecks);
                  },
                ),
                ElectricalFittingView(
                  value: minorChecks.electricalFitting,
                  onDataChanged: (value) {
                    minorChecks.electricalFitting = value;
                    onDataChanged(minorChecks);
                  },
                ),
                PestInspectionView(
                  value: minorChecks.pestInspection,
                  onDataChanged: (value) {
                    minorChecks.pestInspection = value;
                    onDataChanged(minorChecks);
                  },
                ),
                MinorChecksImageCommentForm(
                  value: minorChecks.carpentry,
                  title: 'Carpentry',
                  onDataChanged: (value) {
                    minorChecks.carpentry = value;
                    onDataChanged(minorChecks);
                  },
                ),
                MinorChecksImageCommentForm(
                  value: minorChecks.metalAluminiumWork,
                  title: 'Metal and Alumunium Works',
                  onDataChanged: (value) {
                    minorChecks.metalAluminiumWork = value;
                    onDataChanged(minorChecks);
                  },
                ),
                MinorChecksImageCommentForm(
                  value: minorChecks.cleaning,
                  title: 'Cleaning',
                  onDataChanged: (value) {
                    minorChecks.cleaning = value;
                    onDataChanged(minorChecks);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
