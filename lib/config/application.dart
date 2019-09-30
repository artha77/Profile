import 'dart:ui';

import 'package:profile/app/enums/environment.dart';
import 'package:profile/config/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Application
{
  static const appName = "Profile";
  static const apiBaseUrl = null;
  static const defaultScreenWidth = 400.0;
  static const defaultScreenHeight = 810.0;
  static const defaultLocale = Locale("fr");
  static const supportedLocales = [
    Locale("fr"),
  ];

  static final screen = ScreenUtil.getInstance();

  static final Theme theme = Theme();

  static Environment environment;

}