import 'package:flutter/material.dart';
import 'package:offlinebar/no_network_widget.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Material(
      color: Colors.red,
      elevation: 0,
      child: Column(
        children: [
          Expanded(child: child ?? Container(color: Colors.red)),
          const NoNetworkWidget(),
        ],
      ),
    );
  }
}
