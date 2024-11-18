import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine_step_data.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class IPluginRoutineStepCalendarEntry extends Appointment {

  final IPluginRoutineStepData stepData;

IPluginRoutineStepCalendarEntry.fromStepData(this.stepData) : super(
  subject: stepData.name,
  startTime: stepData.startTime,
  endTime: stepData.startTime,
);
}
