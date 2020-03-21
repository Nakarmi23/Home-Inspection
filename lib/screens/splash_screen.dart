import 'dart:async';

import 'package:flutter/material.dart';
import 'package:house_review/models/IStructuralSystem.dart';
import 'package:house_review/services/sqflite_structural_system_service.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SqliteStructuralSysService().count().then((count) => {
          if (count == 0)
            {
              ['RCC Framed Structure', 'Masonary Structure', 'Steel Structure']
                  .forEach((item) => {
                        SqliteStructuralSysService()
                            .insert(IStructuralSystem(systemName: item))
                      })
            }
        });
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
