import 'package:flutter/material.dart';
import 'package:house_review/components/heading_text.dart';

class AppDropdownMenu extends StatelessWidget {
  const AppDropdownMenu(
      {Key key, this.title, @required this.items, this.value, this.onChanged})
      : super(key: key);
  final String title;
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic value;
  final void Function(dynamic) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: HeadingText(title),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          )),
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: DropdownButton(
            key: key,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.grey.shade800,
                ),
            isExpanded: true,
            value: value,
            onChanged: onChanged,
            items: items,
            underline: Container(),
          ),
        ),
      ],
    );
  }
}
