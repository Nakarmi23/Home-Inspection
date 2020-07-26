import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:house_review/components/app_dropdown_menu.dart';
import 'package:house_review/components/app_input_text_field.dart';
import 'package:house_review/components/dismissible_background.dart';
import 'package:house_review/components/heading_text.dart';
import 'package:house_review/components/image_picker_bottomsheet.dart';
import 'package:house_review/cubit/home_inspection_cubit/home_inspection_cubit.dart';
import 'package:house_review/cubit/inspection_cause_cubit/inspection_cause_cubit.dart';
import 'package:house_review/cubit/inspection_file_info_cubit/inspection_file_info_cubit.dart';
import 'package:house_review/cubit/strucutural_system_cubit/structural_system_cubit.dart';
import 'package:house_review/models/building.dart';
import 'package:house_review/models/insepction_cause.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/models/inspection_file_info.dart';
import 'package:house_review/models/structural_system.dart';
import 'package:house_review/screens/home_inspection_screen/components/material_model_form.dart';
import 'package:house_review/screens/home_inspection_screen/components/room_detail_model_form.dart';
import 'package:house_review/utility/debounce.dart';

part 'home_inspection_form.dart';

class HomeInspectionScreen extends StatelessWidget {
  const HomeInspectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeInspectionForm();
  }
}
