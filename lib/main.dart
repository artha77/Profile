import 'package:profile/app/enums/environment.dart';
import 'package:profile/app/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(environment: Environment.Production));
}