import 'dart:convert';

import 'package:blue_tine_web_components/interfaces/controller/plugin_controller.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_data.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine_data.dart';
import 'package:blue_tine_web_components/plugins/get_up/get_up.dart';
import 'package:blue_tine_web_components/plugins/plugin.enum.dart';
import 'package:blue_tine_web_components/plugins/plugin_manager.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetUpView extends StatefulWidget {
  const GetUpView({super.key});

  @override
  State<GetUpView> createState() => _PluginGetUpState();
}

class _PluginGetUpState extends State<GetUpView> {
  final PluginController routineCubit = PluginManager.controller(PluginEnum.getUp);
  final GetUpData data = GetUpData(PluginEnum.getUp, description: 'A routine for waking up');

  final GetUpRoutine routine = GetUp.getUpRoutine;

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('http://localhost:3000/')) {
            return NavigationDecision.navigate;
          }

          return NavigationDecision.prevent;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://localhost:3000/'));

  void finishRoutine(BuildContext context, JavaScriptMessage message) {
    Map<String, dynamic> decodedMessage = json.decode(message.message);
    final GetUpRoutineData routineData = GetUpRoutineData.fromMap(decodedMessage);

    routineCubit.saveRoutine(routineData).then((_) {
      if (context.mounted) {
        Navigator.of(context).popUntil((s) => s.settings.name == '/');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    controller.addJavaScriptChannel(
      'finishRoutineChannel',
      onMessageReceived: (message) => finishRoutine(context, message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(data.name),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
