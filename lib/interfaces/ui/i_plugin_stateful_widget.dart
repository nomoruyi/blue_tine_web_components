import 'package:blue_tine_web_components/plugins/plugin.enum.dart';
import 'package:flutter/material.dart';

abstract class IPluginStatefulWidget extends StatefulWidget {
  const IPluginStatefulWidget(this.plugin, {super.key});

  final PluginEnum plugin;

}
