import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/minor_checks/minor_checks.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/inspection_minor_check_condition.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/minor_checks_form.dart';
import 'package:house_review/screens/room_inspection/forms/minor_checks/components/radio_list.dart';
import 'package:house_review/utility/debounce.dart';

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
                DoorView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                WindowView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                CellingView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                WallsView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                ElectricalFittingView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                PestInspectionView(
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                MinorChecksImageCommentForm(
                  title: 'Carpentry',
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                MinorChecksImageCommentForm(
                  title: 'Metal and Alumunium Works',
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
                  },
                ),
                MinorChecksImageCommentForm(
                  title: 'Cleaning',
                  onDataChanged: (value) {
                    value.forEach((element) {
                      print(element.toJson());
                    });
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
