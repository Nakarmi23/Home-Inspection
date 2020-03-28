import 'package:flutter/material.dart';

class AppInputTextField extends StatelessWidget {
  const AppInputTextField({
    Key key,
    String labelText,
    bool enabled,
    TextInputType keyboardType,
  })  : _labelText = labelText,
        _enabled = enabled == null ? true : enabled,
        _keyboardType = keyboardType,
        super(key: key);
  final String _labelText;
  final bool _enabled;
  final TextInputType _keyboardType;
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
        width: 2,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0).copyWith(top: 16.0),
      child: Column(
        children: <Widget>[
          // SizedBox.fromSize(
          //   size: Size.fromHeight(16),
          // ),
          TextFormField(
            key: key,
            keyboardType: _keyboardType,
            enabled: _enabled,
            decoration: InputDecoration(
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              labelText: _labelText,
            ),
          )
        ],
      ),
    );
  }
}
