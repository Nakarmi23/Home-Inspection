import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/room_purpose_cubit/room_purpose_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiCubitListener(
      listeners: [
        CubitListener<InspectionCauseCubit, InspectionCauseState>(
          listener: (context, state) {},
        ),
        CubitListener<RoomPurposeCubit, RoomPurposeState>(
          listener: (context, state) {},
        ),
        CubitListener<StructuralSystemCubit, StructuralSystemState>(
          listener: (context, state) {},
        )
      ],
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
