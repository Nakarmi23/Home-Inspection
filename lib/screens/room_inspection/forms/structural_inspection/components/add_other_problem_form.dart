import 'package:flutter/material.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/models/structural_inspection/structural_inspection.dart';

class AddOtherProblemsForm extends StatelessWidget {
  const AddOtherProblemsForm({Key key, @required this.onFormSave})
      : assert(onFormSave != null),
        super(key: key);
  final ValueChanged<OtherProblem> onFormSave;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    OtherProblem problem = OtherProblem();
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
              problem.name = newValue;
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
