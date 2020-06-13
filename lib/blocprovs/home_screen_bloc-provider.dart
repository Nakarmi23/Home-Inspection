import 'package:flutter/material.dart';
import 'package:house_review/bloc/home_screen_bloc.dart';

class HomeScreenBlocProvider extends InheritedWidget {
  HomeScreenBlocProvider({Key key, this.child})
      : _bloc = HomeScreenBloc(),
        super(key: key, child: child);

  final HomeScreenBloc _bloc;
  final Widget child;

  static HomeScreenBloc of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<HomeScreenBlocProvider>())
        ._bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
