import 'package:flutter/material.dart';

Future<bool> deleteItemAlertModel(BuildContext context) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Warning'),
        content:
            Text('Are you sure you want to delete this item from the list?'),
        actions: <Widget>[
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text('Never Mind'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          FlatButton(
            child: Text('I\'m Sure'),
            textColor: Theme.of(context).errorColor,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
