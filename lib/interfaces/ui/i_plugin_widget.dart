import 'package:blue_tine_web_components/plugins/plugin.enum.dart';
import 'package:flutter/material.dart';

abstract class IPluginStatelessWidget extends StatelessWidget {
  const IPluginStatelessWidget(this.plugin, {super.key});

  final PluginEnum plugin;

}
