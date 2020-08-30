import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/cubit/home_inspection_cubit/home_inspection_cubit.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
import 'package:house_review/cubit/room_purpose_cubit/room_purpose_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';
import 'package:house_review/screens/generated_pdf_screen/generated_pdf_screen.dart';
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
      CubitProvider(create: (context) => HomeInspectionCubit())
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => SplashScreen());
          case '/home':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/inspectionForm':
            return MaterialPageRoute(
                builder: (_) => HomeInspectionScreen(
                      isEditing: settings.arguments,
                    ));
          case '/roomFrom':
            return MaterialPageRoute(
                builder: (_) => RoomInspectionScreen(
                      inspectionData: (settings.arguments
                          as Map<String, dynamic>)['inspectionData'],
                      roomIndex: (settings.arguments
                          as Map<String, dynamic>)['roomIndex'],
                    ));
          case '/generateReport':
            return MaterialPageRoute(
                builder: (_) => GeneratedPDFScreen(
                      inspectionData: settings.arguments,
                    ));
        }
      },
    );
  }
}
