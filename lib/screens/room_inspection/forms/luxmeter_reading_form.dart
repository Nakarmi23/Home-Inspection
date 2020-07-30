import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/components/simple_add_dialog.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/luxmeter_reading.dart';

class LuxmeterReadingForm extends StatefulWidget {
  const LuxmeterReadingForm({Key key, @required this.onDataChanged})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<LuxmeterReading>> onDataChanged;
  @override
  _LuxmeterReadingFormState createState() => _LuxmeterReadingFormState();
}

class _LuxmeterReadingFormState extends State<LuxmeterReadingForm> {
  List<LuxmeterReading> luxmeterReadings = [LuxmeterReading()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createLuxmeterReadingSample(),
      ],
    );
  }

  List<Form> createLuxmeterReadingSample() {
    return luxmeterReadings
        .asMap()
        .keys
        .map(
          (sampleIndex) => Form(
            key: formKeys[sampleIndex],
            onChanged: () {
              formKeys[sampleIndex].currentState.save();
              widget.onDataChanged(luxmeterReadings);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: HeadingText('Sample ${sampleIndex + 1}'),
                ),
                AppInputTextField(
                  labelText: 'Sample Source',
                  onSaved: (newValue) {
                    luxmeterReadings[sampleIndex].source = newValue;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                      'Sample ${sampleIndex + 1} - Upload Photo'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 80,
                    child: ImageListViewBuilder(
                      onImageAdd: (path) {
                        setState(() {
                          luxmeterReadings[sampleIndex].photos.add(path);
                        });
                        widget.onDataChanged(luxmeterReadings);
                      },
                      onImageTap: (index) {},
                      images: luxmeterReadings[sampleIndex].photos,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText('Sample 1 - Luxmeter Reading'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('S.N.')),
                      DataColumn(label: Text('Readings')),
                    ],
                    rows: [
                      ...createLuxmeterReadingDataRow(sampleIndex),
                      DataRow(
                        cells: [
                          DataCell(
                            Text('Average (1 to 10)'),
                          ),
                          DataCell(
                            Text('Auto Generated'),
                            onTap: null,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  List<DataRow> createLuxmeterReadingDataRow(int sampleIndex) =>
      luxmeterReadings[sampleIndex]
          .reading
          .asMap()
          .keys
          .map(
            (readingIndex) => DataRow(
              cells: [
                DataCell(
                  Text('${readingIndex + 1}'),
                  placeholder: true,
                ),
                DataCell(
                  Text(luxmeterReadings[sampleIndex].reading[readingIndex]),
                  onTap: () {
                    showSimpleAddDialog(
                      context,
                      title: 'Add Luxmeter Reading',
                      onFormSave: (value) {
                        setState(() {
                          luxmeterReadings[sampleIndex].reading[readingIndex] =
                              value;
                        });
                        Navigator.of(context).pop();
                        widget.onDataChanged(luxmeterReadings);
                      },
                      toEditValue:
                          luxmeterReadings[sampleIndex].reading[readingIndex],
                    );
                  },
                  placeholder: true,
                  showEditIcon: true,
                ),
              ],
            ),
          )
          .toList()
            ..add(
              DataRow(
                cells: [
                  DataCell(
                    Text('${luxmeterReadings[sampleIndex].reading.length + 1}'),
                    placeholder: true,
                  ),
                  DataCell(
                    Text('Enter Readings Here'),
                    onTap: () {
                      showSimpleAddDialog(
                        context,
                        title: 'Add Luxmeter Reading',
                        onFormSave: (value) {
                          setState(() {
                            luxmeterReadings[sampleIndex].reading.add(value);
                          });
                          Navigator.of(context).pop();
                          widget.onDataChanged(luxmeterReadings);
                        },
                      );
                    },
                    placeholder: true,
                    showEditIcon: true,
                  )
                ],
              ),
            );
}
