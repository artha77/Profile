import 'package:profile/config/theme_colors.dart';
import 'package:flutter/material.dart';

class Theme {
  ThemeData defaultTheme;

  Theme() {
    defaultTheme = _buildTheme();
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData.light();

    return ThemeData(
        fontFamily: 'Lato',

        accentColor: ThemeColors.SecondaryColor,
        accentColorBrightness: Brightness.dark,
        primaryColor: ThemeColors.PrimaryColor,
        primaryColorDark: ThemeColors.PrimaryColorDark,
        primaryColorLight: ThemeColors.PrimaryColorLight,
        primaryColorBrightness: Brightness.dark,

        buttonTheme: baseTheme.buttonTheme.copyWith(
          buttonColor: ThemeColors.SecondaryColor,
          textTheme: ButtonTextTheme.primary,
        ),

        scaffoldBackgroundColor: ThemeColors.Background,
        cardColor: ThemeColors.Background,
        textSelectionColor: ThemeColors.PrimaryColorLight,
        backgroundColor: ThemeColors.Background,

        textTheme: baseTheme.textTheme.copyWith(
          title:
          baseTheme.textTheme.title.copyWith(color: ThemeColors.TextColor),
          body1:
          baseTheme.textTheme.body1.copyWith(color: ThemeColors.TextColor),
          body2:
          baseTheme.textTheme.body2.copyWith(color: ThemeColors.TextColor),
        ));
  }
}
