import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';

Future showSimpleAddDialog(
  BuildContext context, {
  @required String title,
  @required ValueChanged<String> onFormSave,
  String toEditValue,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text(title),
        children: <Widget>[
          SimpleAddDialog(
            onFormSave: onFormSave,
            toEditValue: toEditValue,
            title: title,
          ),
        ],
      );
    },
  );
}

class SimpleAddDialog extends StatelessWidget {
  const SimpleAddDialog(
      {Key key,
      @required this.onFormSave,
      @required this.title,
      this.toEditValue})
      : assert(onFormSave != null),
        assert(title != null),
        super(key: key);
  final ValueChanged<String> onFormSave;
  final String toEditValue;
  final String title;
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
            labelText: title,
            initialValue: toEditValue,
            validator: (value) {
              switch (value) {
                case '':
                  return 'This Field cannot be empty';
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
