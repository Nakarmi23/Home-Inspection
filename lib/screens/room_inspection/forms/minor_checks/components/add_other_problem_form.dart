import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/models/minor_checks/minor_check_condition.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';

Future<MinorChecksCondition> buildAddOtherProblemDialog(
    BuildContext context, int doorIndex) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text('Other Fixture'),
        children: <Widget>[
          AddOtherProblemsForm(
            onFormSave: (problem) {
              Navigator.of(context).pop(problem);
            },
          )
        ],
      );
    },
  );
}

class AddOtherProblemsForm extends StatelessWidget {
  const AddOtherProblemsForm({Key key, @required this.onFormSave})
      : assert(onFormSave != null),
        super(key: key);
  final ValueChanged<MinorChecksCondition> onFormSave;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    MinorChecksCondition problem = MinorChecksCondition();
    return Form(
      key: formKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          AppInputTextField(
            labelText: 'Other Problem Name',
            validator: (value) {
              switch (value) {
                case '':
                  return 'Name of the problem cannot be empty';
                default:
              }
            },
            onSaved: (newValue) {
              problem.otherFixtureName = newValue;
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
                      onFormSave(problem);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
