import 'package:flutter/material.dart';

class AppInputTextField extends StatelessWidget {
  const AppInputTextField({
    Key key,
    this.labelText,
    this.enabled,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
    this.validator,
    this.controller,
    this.autofocus = false,
  }) : super(key: key);

  final String labelText;
  final bool enabled;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final String initialValue;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool autofocus;
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
        keyboardType: keyboardType,
        enabled: enabled,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        initialValue: initialValue,
        validator: validator,
        controller: controller,
        autofocus: autofocus,
        decoration: InputDecoration(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          labelText: labelText,
        ),
      ),
    );
  }
}
