import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/components/simple_add_dialog.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/seepage_analysis.dart';

class SeepageAnalysisFrom extends StatefulWidget {
  const SeepageAnalysisFrom({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<SeepageAnalysis>> onDataChanged;
  final List<SeepageAnalysis> value;
  @override
  _SeepageAnalysisFromState createState() => _SeepageAnalysisFromState();
}

class _SeepageAnalysisFromState extends State<SeepageAnalysisFrom> {
  List<SeepageAnalysis> seepageAnalysisList = [SeepageAnalysis()];
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    seepageAnalysisList =
        widget.value.isEmpty ? seepageAnalysisList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createSeepageAnalysisSample(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Luxmeter Reading Sample'),
                ),
                Icon(
                  Icons.add_circle,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          onTap: () {
            formKeys.add(GlobalKey());
            setState(() {
              seepageAnalysisList.add(SeepageAnalysis());
            });
          },
        ),
      ],
    );
  }

  List<Form> createSeepageAnalysisSample() => seepageAnalysisList
      .asMap()
      .keys
      .map((seepageAnalysisIndex) => Form(
            key: formKeys[seepageAnalysisIndex],
            onChanged: () {
              formKeys[seepageAnalysisIndex].currentState.save();
              widget.onDataChanged(seepageAnalysisList);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: HeadingText(
                    'Sample ${seepageAnalysisIndex + 1} - Visual Inspection',
                  ),
                ),
                AppInputTextField(
                  initialValue:
                      seepageAnalysisList[seepageAnalysisIndex].temperature,
                  labelText: 'Temperature',
                  onSaved: (newValue) {
                    seepageAnalysisList[seepageAnalysisIndex].temperature =
                        newValue;
                  },
                ),
                AppInputTextField(
                  initialValue:
                      seepageAnalysisList[seepageAnalysisIndex].condition,
                  labelText: 'Condition',
                  onSaved: (newValue) {
                    seepageAnalysisList[seepageAnalysisIndex].condition =
                        newValue;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Upload photo (Normal Camera)',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 80,
                    child: ImageListViewBuilder(
                      onImageAdd: (path) {
                        setState(() {
                          seepageAnalysisList[seepageAnalysisIndex]
                              .photosNormal
                              .add(path);
                        });
                        widget.onDataChanged(seepageAnalysisList);
                      },
                      onImageTap: (index) {},
                      images: seepageAnalysisList[seepageAnalysisIndex]
                          .photosNormal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Upload photo (Thermal Camera)',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 80,
                    child: ImageListViewBuilder(
                      onImageAdd: (path) {
                        setState(() {
                          seepageAnalysisList[seepageAnalysisIndex]
                              .photosThermal
                              .add(path);
                        });
                        widget.onDataChanged(seepageAnalysisList);
                      },
                      onImageTap: (index) {},
                      images: seepageAnalysisList[seepageAnalysisIndex]
                          .photosThermal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Moisture Meter Reading',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('S.N.')),
                      DataColumn(label: Text('Readings')),
                    ],
                    rows: [
                      ...createSeepageAnalysisFromDataRow(seepageAnalysisIndex)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Upload Photo using Moisture Meter',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 80,
                    child: ImageListViewBuilder(
                      onImageAdd: (path) {
                        setState(() {
                          seepageAnalysisList[seepageAnalysisIndex]
                              .photosMoistureMeter
                              .add(path);
                        });
                        widget.onDataChanged(seepageAnalysisList);
                      },
                      onImageTap: (index) {},
                      images: seepageAnalysisList[seepageAnalysisIndex]
                          .photosMoistureMeter,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Digital Level',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SubHeadingText(
                    'Upload Photo',
                    subHeading: SubHeading.sub2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: 80,
                    child: ImageListViewBuilder(
                      onImageAdd: (path) {
                        setState(() {
                          seepageAnalysisList[seepageAnalysisIndex]
                              .photosDigitalLevel
                              .add(path);
                        });
                        widget.onDataChanged(seepageAnalysisList);
                      },
                      onImageTap: (index) {},
                      images: seepageAnalysisList[seepageAnalysisIndex]
                          .photosDigitalLevel,
                    ),
                  ),
                ),
                AppInputTextField(
                  initialValue: seepageAnalysisList[seepageAnalysisIndex]
                      .commentsDigitalLevel,
                  labelText: 'Comment on Digital Level Verification',
                  onSaved: (newValue) {
                    seepageAnalysisList[seepageAnalysisIndex]
                        .commentsDigitalLevel = newValue;
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 16.0)),
              ],
            ),
          ))
      .toList();
  List<DataRow> createSeepageAnalysisFromDataRow(int sampleIndex) =>
      seepageAnalysisList[sampleIndex]
          .readings
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
                  Text(seepageAnalysisList[sampleIndex].readings[readingIndex]),
                  onTap: () {
                    showSimpleAddDialog(
                      context,
                      title: 'Add Moisture Meter Reading',
                      onFormSave: (value) {
                        setState(() {
                          seepageAnalysisList[sampleIndex]
                              .readings[readingIndex] = value;
                        });
                        Navigator.of(context).pop();
                        widget.onDataChanged(seepageAnalysisList);
                      },
                      toEditValue: seepageAnalysisList[sampleIndex]
                          .readings[readingIndex],
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
                    Text(
                        '${seepageAnalysisList[sampleIndex].readings.length + 1}'),
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
                            seepageAnalysisList[sampleIndex]
                                .readings
                                .add(value);
                          });
                          Navigator.of(context).pop();
                          widget.onDataChanged(seepageAnalysisList);
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
