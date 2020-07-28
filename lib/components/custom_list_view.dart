import 'package:flutter/widgets.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {Key key, this.children, this.applyBottomPaddingOfKeyboard = true})
      : super(key: key);
  final List<Widget> children;
  final bool applyBottomPaddingOfKeyboard;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: applyBottomPaddingOfKeyboard
          ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
