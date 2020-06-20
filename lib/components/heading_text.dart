import 'package:flutter/material.dart';

enum Heading { h1, h2, h3, h4, h5, h6 }

class HeadingText extends StatelessWidget {
  final String text;
  final Heading heading;
  const HeadingText(this.text, {Key key, this.heading = Heading.h6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getHeadingStyle(context),
    );
  }

  _getHeadingStyle(BuildContext context) {
    switch (heading) {
      case Heading.h1:
        return Theme.of(context).textTheme.headline1;
        break;
      case Heading.h2:
        return Theme.of(context).textTheme.headline2;
        break;
      case Heading.h3:
        return Theme.of(context).textTheme.headline3;
        break;
      case Heading.h4:
        return Theme.of(context).textTheme.headline4;
        break;
      case Heading.h5:
        return Theme.of(context).textTheme.headline5;
        break;
      case Heading.h6:
        return Theme.of(context).textTheme.headline6;
        break;
      default:
        return null;
    }
  }
}
