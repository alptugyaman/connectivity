import 'package:flutter/material.dart';
import 'package:offlinebar/home_view.dart';
import 'package:offlinebar/main_app_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      builder: MainBuild.build,
      home: HomeView(),
    );
  }
}
