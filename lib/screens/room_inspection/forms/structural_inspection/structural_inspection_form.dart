import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';

part 'visual_inspection_sheet_view.dart';
part 'non_distructive_test_view.dart';

class StructuralInspectionForm extends StatelessWidget {
  const StructuralInspectionForm({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                VisualInspectionSheetView(),
                NonDestructiveTestView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
