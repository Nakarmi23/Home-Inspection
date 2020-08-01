import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/custom_list_view.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_listview_builder.dart';
import 'package:house_review/components/sub_heading_text.dart';
import 'package:house_review/models/water_quality.dart';
import 'package:house_review/utility/debounce.dart';

class WaterQualityForm extends StatefulWidget {
  const WaterQualityForm({Key key, @required this.onDataChanged, this.value})
      : assert(onDataChanged != null),
        super(key: key);
  final ValueChanged<List<WaterQuality>> onDataChanged;
  final List<WaterQuality> value;
  @override
  _WaterQualityFormState createState() => _WaterQualityFormState();
}

class _WaterQualityFormState extends State<WaterQualityForm> {
  List<GlobalKey<FormState>> formKeys = [GlobalKey()];
  List<WaterQuality> waterQualityList = [WaterQuality()];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    waterQualityList = widget.value.isEmpty ? waterQualityList : widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      children: <Widget>[
        ...createWaterQualitySample(),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text('Add Water Quality Sample'),
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
              waterQualityList.add(WaterQuality());
            });
          },
        ),
      ],
    );
  }

  List<Form> createWaterQualitySample() => waterQualityList
      .asMap()
      .keys
      .map(
        (key) => Form(
          key: formKeys[key],
          onChanged: () {
            debounceEvent(() {
              formKeys[key].currentState.save();
              widget.onDataChanged(waterQualityList);
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: HeadingText('Sample ${key + 1}'),
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].source,
                labelText: 'Sample Source',
                onSaved: (newValue) {
                  waterQualityList[key].source = newValue;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SubHeadingText('Sample ${key + 1} - Upload Photo'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: SizedBox(
                  height: 80,
                  child: ImageListViewBuilder(
                    onImageAdd: (path) {
                      setState(() {
                        waterQualityList[key].photos.add(path);
                      });
                      widget.onDataChanged(waterQualityList);
                    },
                    onImageTap: (index) {},
                    images: waterQualityList[key].photos,
                  ),
                ),
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].color,
                labelText: 'Color',
                onSaved: (newValue) {
                  waterQualityList[key].color = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].taste,
                labelText: 'Taste',
                onSaved: (newValue) {
                  waterQualityList[key].taste = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].odour,
                labelText: 'Odour',
                onSaved: (newValue) {
                  waterQualityList[key].odour = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].phValue,
                labelText: 'PH Value',
                onSaved: (newValue) {
                  waterQualityList[key].phValue = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].turbidty,
                labelText: 'Turbuduty',
                onSaved: (newValue) {
                  waterQualityList[key].turbidty = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].ecMeterReading,
                labelText: 'EC Meter Reading',
                onSaved: (newValue) {
                  waterQualityList[key].ecMeterReading = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].temperature,
                labelText: 'Temperature',
                onSaved: (newValue) {
                  waterQualityList[key].temperature = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].tdsMeterReading,
                labelText: 'TDS Meter Reading',
                onSaved: (newValue) {
                  waterQualityList[key].tdsMeterReading = newValue;
                },
              ),
              AppInputTextField(
                initialValue: waterQualityList[key].chlorineMeterReading,
                labelText: 'Chlorine Meter Reading',
                onSaved: (newValue) {
                  waterQualityList[key].chlorineMeterReading = newValue;
                },
              ),
            ],
          ),
        ),
      )
      .toList();
}
