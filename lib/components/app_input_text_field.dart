import 'package:flutter/material.dart';

class AppInputTextField extends StatelessWidget {
  const AppInputTextField({
    Key key,
    String labelText,
    bool enabled,
    TextInputType keyboardType,
    Function(String) onChange,
    Function(String) onFieldSubmitted,
  })  : _labelText = labelText,
        _enabled = enabled == null ? true : enabled,
        _keyboardType = keyboardType,
        _onChanged = onChange,
        _onFieldSubmitted = onFieldSubmitted,
        super(key: key);
  final String _labelText;
  final bool _enabled;
  final TextInputType _keyboardType;
  final Function(String) _onChanged;
  final Function(String) _onFieldSubmitted;
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
      child: TextFormField(
        key: key,
        keyboardType: _keyboardType,
        enabled: _enabled,
        onChanged: _onChanged,
        onFieldSubmitted: _onFieldSubmitted,
        decoration: InputDecoration(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          labelText: _labelText,
        ),
      ),
    );
  }
}
