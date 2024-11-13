import 'dart:convert';

import 'package:blue_tine_web_components/interfaces/data/enums/routine_status.dart';
import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine.dart';
import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine_data.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine_step_data.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:webview_flutter_platform_interface/src/types/javascript_message.dart';

part 'get_up_routine_data.g.dart';

@HiveType(typeId: 22)
class GetUpRoutineData extends IPluginRoutineData {
  GetUpRoutineData(super.routine, {super.status = RoutineStatus.open, super.rating = 0});

  @override
  // TODO: implement props
  List<Object?> get props => [routine];

  factory GetUpRoutineData.fromMap(Map<String, dynamic> data) {
    GetUpRoutineData routineData = GetUpRoutineData(data['data']);

    routineData.status = RoutineStatus.values.byName(data['status']!.trim().toLowerCase());
    routineData.startTime = DateTime.tryParse(data['startTime']!)!;
    routineData.endTime = DateTime.tryParse(data['endTime']!)!;
    routineData.rating = double.tryParse(data['rating']!)!;
    routineData.comment = data['comment'];
    routineData.endTime = DateTime.tryParse(data['endTime']!)!;
    routineData.stepsData = ((data['stepsData'] ?? <GetUpRoutineStepData>[]) as List).map((e) => GetUpRoutineStepData.fromMap(e)).toList()..sort();

    return routineData;
  }



  static GetUpRoutineData fromMessage(JavaScriptMessage message) => GetUpRoutineData.fromMap(json.decode(message.message));
}
