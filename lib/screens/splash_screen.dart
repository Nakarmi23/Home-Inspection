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
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = SplashScreenBlocProvider.of(context);
    _bloc.isDefaultDataInitialized();
    _bloc.isAppInitialized.listen((data) {
      if (!data.isAllDataInitialized) {
        if (!data.inspectionCause) {
          _bloc.initializeInspectionCause();
        } else if (!data.structuralSystem) {
          _bloc.initializeStructuralSystem();
        } else {
          Navigator.of(context).pushReplacementNamed('/inspectionForm');
        }
      } else {
        Navigator.of(context).pushReplacementNamed('/inspectionForm');
      }
    }).onError((err) {
      throw err;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
