import 'package:flutter/widgets.dart';
import 'package:house_review/bloc/home_inspection_screen_bloc.dart';

class HomeInspectionScreenBlocProvider extends InheritedWidget {
  HomeInspectionScreenBlocProvider({Key key, this.child})
      : _bloc = HomeInspectionScreenBloc(),
        super(key: key, child: child);

  final Widget child;
  final HomeInspectionScreenBloc _bloc;

  static HomeInspectionScreenBloc of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<HomeInspectionScreenBlocProvider>()
        ._bloc);
  }

  @override
  bool updateShouldNotify(HomeInspectionScreenBlocProvider oldWidget) {
    return true;
  }
}
