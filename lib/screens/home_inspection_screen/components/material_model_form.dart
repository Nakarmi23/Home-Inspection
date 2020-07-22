import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';

typedef void MaterialFormSave(String value);

class MaterialModelForm extends StatelessWidget {
  const MaterialModelForm({
    Key key,
    @required this.onFormSave,
    this.toEditValue,
  })  : assert(onFormSave != null),
        super(key: key);
  final MaterialFormSave onFormSave;
  final String toEditValue;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String materialName;
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          AppInputTextField(
            autofocus: true,
            initialValue: toEditValue ?? '',
            labelText: 'Material Name',
            onSaved: (newValue) {
              materialName = newValue;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  child: Text('Add'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      onFormSave(materialName);
                    }
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
