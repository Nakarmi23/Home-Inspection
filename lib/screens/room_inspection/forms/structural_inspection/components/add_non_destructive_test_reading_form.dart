import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';

class AddNonDestructiveTestReadingForm extends StatelessWidget {
  const AddNonDestructiveTestReadingForm(
      {Key key, @required this.onFormSave, this.toEditValue})
      : assert(onFormSave != null),
        super(key: key);
  final ValueChanged<String> onFormSave;
  final String toEditValue;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String reading = toEditValue;
    return Form(
      key: formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          AppInputTextField(
            labelText: 'Reading',
            initialValue: toEditValue,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            validator: (value) {
              switch (value) {
                case '':
                  return 'Reading cannot be empty';
                default:
              }
            },
            onSaved: (newValue) {
              reading = newValue;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0)
                .copyWith(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      onFormSave(reading);
                    }
                  },
                  child: Text(toEditValue == null ? 'Add' : 'Edit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
