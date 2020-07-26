import 'package:flutter/material.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({
    Key key,
    @required this.color,
    @required this.icon,
    @required this.child,
    this.forDirection = DismissDirection.startToEnd,
  })  : assert(forDirection == DismissDirection.endToStart ||
            forDirection == DismissDirection.startToEnd),
        assert(child != null),
        assert(color != null),
        super(key: key);
  final Color color;
  final Widget child;
  final Icon icon;
  final DismissDirection forDirection;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: forDirection == DismissDirection.startToEnd
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                icon,
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
