import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
import 'package:house_review/cubit/room_purpose_cubit/room_purpose_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double loadingProgress = 0;

  void changeLoadingProgress() {
    setState(() {
      loadingProgress = loadingProgress + (1 / 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiCubitListener(
      listeners: [
        CubitListener<InspectionCauseCubit, InspectionCauseState>(
          listener: (context, state) {
            if (state is InspectionCauseSuccess) changeLoadingProgress();
          },
        ),
        CubitListener<RoomPurposeCubit, RoomPurposeState>(
          listener: (context, state) {
            if (state is RoomPurposeState) changeLoadingProgress();
          },
        ),
        CubitListener<StructuralSystemCubit, StructuralSystemState>(
          listener: (context, state) {
            if (state is StructuralSystemSuccess) changeLoadingProgress();
          },
        ),
        CubitListener<InspectionFileInfoCubit, InspectionFileInfoState>(
          listener: (context, state) {
            if (state is InspectionFileInfoSuccess) changeLoadingProgress();
          },
        )
      ],
      child: Scaffold(
        body: Stack(
          overflow: Overflow.clip,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Center(
              child: SizedBox.fromSize(
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
                size: Size.fromHeight(140),
              ),
            ),
            Positioned(
              bottom: 16.0 * 8,
              width: MediaQuery.of(context).size.width - (16.0 * 6),
              child: Column(
                children: <Widget>[
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: loadingProgress),
                    duration: Duration(
                      milliseconds: 250,
                    ),
                    onEnd: () {
                      if (loadingProgress == 1)
                        Navigator.of(context).pushReplacementNamed('/home');
                    },
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: Colors.grey.shade300,
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
