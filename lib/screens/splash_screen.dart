import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed('/inspectionForm'),
    );
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
