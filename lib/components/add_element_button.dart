import 'package:flutter/material.dart';

class AddElementButton extends StatelessWidget {
  const AddElementButton({Key key, this.onTap, this.title}) : super(key: key);
  final GestureTapCallback onTap;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: title,
            ),
            Icon(
              Icons.add_circle,
              color: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
