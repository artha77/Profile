import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/app/enums/environment.dart';
import 'package:profile/app/scoped_models/app_scoped_model.dart';
import 'package:profile/app/ui/profile/profile_page.dart';
import 'package:profile/config/application.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyApp extends StatelessWidget {
  AppScopedModel _appScopedModel;

  MyApp({Environment environment = Environment.Production}) {
    Application.environment = Environment.Development;
    _appScopedModel = AppScopedModel();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _appScopedModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: Application.environment == Environment.Development,
        title: Application.appName,
        theme: Application.theme.defaultTheme,
        home: ProfilePage()
      ),
    );
  }
}
