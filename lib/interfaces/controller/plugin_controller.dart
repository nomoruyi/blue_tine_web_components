import 'package:blue_tine_web_components/interfaces/data/i_plugin_routine_data.dart';
import 'package:blue_tine_web_components/plugins/plugin.enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class PluginController with HiveObjectMixin  {
  PluginController(this.plugin) ;

  @HiveField(0)
  final PluginEnum plugin;

  @HiveField(1, defaultValue: false)
  bool isInstalled = false;

  Box<IPluginRoutineData> get routineBox;

  List<IPluginRoutineData> get routines;

  Future<void> install();

  Future<void> uninstall() ;

  Future<Widget> loadPluginView();

  Future<void> saveRoutine(IPluginRoutineData routineData);

  int getCurrentStreak() ;

  int getMaxStreak() ;

  int getTotalExecutions();

  double getAvgRating();
}
