import 'package:flutter/material.dart';

enum SubHeading { sub1, sub2 }

class SubHeadingText extends StatelessWidget {
  final String text;
  final SubHeading subHeading;
  const SubHeadingText(this.text, {Key key, this.subHeading = SubHeading.sub1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getHeadingStyle(context),
    );
  }

  _getHeadingStyle(BuildContext context) {
    switch (subHeading) {
      case SubHeading.sub1:
        return Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontWeight: FontWeight.bold);
        break;
      case SubHeading.sub2:
        return Theme.of(context).textTheme.subtitle2.copyWith(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            );
        break;
      default:
        return null;
    }
  }
}
