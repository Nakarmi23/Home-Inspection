import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
import 'package:house_review/cubit/room_purpose_cubit/room_purpose_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';
import 'package:house_review/screens/home_inspection_screen/home_inspection_screen.dart';
import 'package:house_review/screens/home_screen.dart';
import 'package:house_review/screens/room_inspection/room_inspection_screen.dart';
import 'package:house_review/screens/splash_screen/splash_screen.dart';
import 'package:house_review/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiCubitProvider(
    providers: [
      CubitProvider(
          create: (context) => InspectionCauseCubit()..initializeData()),
      CubitProvider(create: (context) => RoomPurposeCubit()..initializeData()),
      CubitProvider(
          create: (context) => StructuralSystemCubit()..initializeData()),
      CubitProvider(create: (context) => InspectionFileInfoCubit()..loadData()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill Sewa: Home Inspection',
      theme: appData(),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/inspectionForm': (context) => HomeInspectionScreen(),
        '/roomFrom': (context) => RoomInspectionScreen(),
      },
    );
  }
}
