import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';
import 'package:house_review/screens/room_inspection/components/inspection_image_comment.dart';
import 'package:house_review/screens/room_inspection/forms/structural_inspection/components/add_non_destructive_test_reading_form.dart';
import 'package:house_review/screens/room_inspection/forms/structural_inspection/components/add_other_problem_form.dart';
import 'package:house_review/utility/debounce.dart';

part 'visual_inspection_sheet_view.dart';
part 'non_distructive_test_view.dart';

class StructuralInspectionForm extends StatelessWidget {
  const StructuralInspectionForm(
      {Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final StructuralInspection value;
  final ValueChanged<StructuralInspection> onDataChanged;
  @override
  Widget build(BuildContext context) {
    StructuralInspection structuralInspection = StructuralInspection();
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            child: TabBar(
              onTap: (value) {},
              tabs: [
                Tab(
                  text: 'Visual Inspection Sheet',
                ),
                Tab(text: 'Non Destructive Test'),
              ],
            ),
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                VisualInspectionSheetView(
                  value: value?.visualInspection,
                  onFormSave: (value) {
                    structuralInspection.visualInspection = value;
                    onDataChanged(structuralInspection);
                  },
                ),
                NonDestructiveTestView(
                  value: value?.nonDestructiveTest,
                  onFormSave: (value) {
                    structuralInspection.nonDestructiveTest = value;
                    onDataChanged(structuralInspection);
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
