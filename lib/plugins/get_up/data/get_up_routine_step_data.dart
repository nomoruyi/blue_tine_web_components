import 'package:blue_tine_web_components/interfaces/data/enums/routine_status.dart';
import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine_step.dart';
import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine_step_data.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine_step.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'get_up_routine_step_data.g.dart';

@HiveType(typeId: 24)
class GetUpRoutineStepData extends IPluginRoutineStepData {
  GetUpRoutineStepData(super.step, {super.skipped});

  factory GetUpRoutineStepData.fromMap(Map<String, dynamic> data) {
    GetUpRoutineStepData stepData = GetUpRoutineStepData(GetUpRoutineStep.fromMap(data['step']));

    stepData.status = RoutineStatus.values.byName(data['status']!.trim().toLowerCase());
    stepData.startTime = DateTime.tryParse(data['startTime']!)!;
    stepData.endTime = DateTime.tryParse(data['endTime']!)!;
    stepData.duration = Duration(seconds: data['durationInSeconds']);
    stepData.skipped = data['skipped'];

    return stepData;
  }
}
