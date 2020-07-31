import 'package:flutter/material.dart';

class RadioList extends StatelessWidget {
  const RadioList({
    Key key,
    @required this.groupValue,
    @required this.onChanged,
  }) : super(key: key);
  final int groupValue;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RadioListTile(
          value: 1,
          groupValue: groupValue,
          onChanged: onChanged,
          title: Text('Good Condition'),
        ),
        RadioListTile(
          value: 2,
          groupValue: groupValue,
          onChanged: onChanged,
          title: Text('Bad Condition'),
        ),
        RadioListTile(
          value: 0,
          groupValue: groupValue,
          onChanged: onChanged,
          title: Text('Skip'),
        ),
      ],
    );
  }
}
