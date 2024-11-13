import 'package:blue_tine_web_components/app/cubits/routine/routine_cubit.dart';
import 'package:blue_tine_web_components/interfaces/ui/i_plugin_stateful_widget.dart';
import 'package:blue_tine_web_components/plugins/get_up/data/get_up_routine_data.dart';
import 'package:blue_tine_web_components/plugins/get_up/get_up_main.dart';
import 'package:blue_tine_web_components/plugins/plugin_manager.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GetUpView extends IPluginStatefulWidget {
  const GetUpView(super.plugin, {super.key});

  @override
  State<GetUpView> createState() => _PluginWebViewState();
}

class _PluginWebViewState extends State<GetUpView> {
  // final WebViewData data = WebViewData(Plugin.webView, description: 'A routine for waking up');
  //
  final GetUpRoutineData routineData = GetUpRoutineData(GetUpP.getUpRoutine);
  final PluginController _routineController = PluginManager.plugins[GetUpP]!;

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('http://localhost:3000/')) {
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://localhost:3000/'));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addJavaScriptChannel('finishRoutineChannel', onMessageReceived: finishRoutine);
  }

  void finishRoutine(JavaScriptMessage message) {
    final GetUpRoutineData routineData = GetUpRoutineData.fromMessage(message);

    _routineController.saveRoutine(routineData).then((_) {
      Navigator.of(context).popUntil((s) => s.settings.name == '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(routineData.routine.name),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }


}
