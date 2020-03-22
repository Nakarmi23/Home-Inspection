import 'package:flutter/widgets.dart';
import 'package:house_review/bloc/splash_screen_bloc.dart';

class SplashScreenBlocProvider extends InheritedWidget {
  SplashScreenBlocProvider({Key key, this.child})
      : _bloc = SplashScreenBloc(),
        super(key: key, child: child);

  final Widget child;
  final SplashScreenBloc _bloc;

  static SplashScreenBloc of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<SplashScreenBlocProvider>())
        ._bloc;
  }

  @override
  bool updateShouldNotify(SplashScreenBlocProvider oldWidget) {
    return true;
  }
}
