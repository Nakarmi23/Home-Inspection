import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/sub_heading_text.dart';

class WaterQualityForm extends StatelessWidget {
  const WaterQualityForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: HeadingText('Sample 1'),
        ),
        AppInputTextField(
          labelText: 'Sample Source',
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: SubHeadingText('Sample 1 - Upload Photo'),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 80,
                  width: 80,
                  child: Material(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.grey.shade300,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(7.0),
                      onTap: () {},
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.grey.shade600,
                            ),
                            Text(
                              'Add Photo',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        AppInputTextField(
          labelText: ' Color',
        ),
        AppInputTextField(
          labelText: ' Taste',
        ),
        AppInputTextField(
          labelText: 'Odour',
        ),
        AppInputTextField(
          labelText: ' PH Value',
        ),
        AppInputTextField(
          labelText: ' Turbuduty',
        ),
        AppInputTextField(
          labelText: ' EC Meter Reading',
        ),
        AppInputTextField(
          labelText: ' Temperature',
        ),
        AppInputTextField(
          labelText: ' TDS Meter Reading',
        ),
        AppInputTextField(
          labelText: ' Chlorine Meter Reading',
        ),
      ],
    );
  }
}
