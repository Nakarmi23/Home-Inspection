import 'package:flutter/material.dart';
import 'package:house_review/screens/home_inspection_screen/home_inspection_screen.dart';
import 'package:house_review/screens/splash_screen.dart';
import 'package:house_review/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: appData(),
        home: SplashScreen(),
        routes: {'/inspectionForm': (context) => HomeInspectionScreen()});
  }
}
