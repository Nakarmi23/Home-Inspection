import 'dart:async';

import 'package:flutter/material.dart';
import 'package:house_review/bloc/splash_screen_bloc.dart';
import 'package:house_review/blocprovs/splash_screen_bloc_provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc _bloc;
  Timer _navigateTimer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = SplashScreenBlocProvider.of(context);
    _bloc.getStructuralSystemCount();
    _bloc.structuralSystemCount.listen((count) {
      if (count == 0) {
        _bloc.initializeStructuralSystem();
      } else {
        _navigateTimer = Timer(
          Duration(seconds: 2),
          () => Navigator.of(context).pushReplacementNamed('/inspectionForm'),
        );
      }
    }).onError((err) {
      throw (err);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _navigateTimer.cancel();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: SizedBox.fromSize(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
            size: Size.fromHeight(140),
          ),
        ),
      ),
    );
  }
}
