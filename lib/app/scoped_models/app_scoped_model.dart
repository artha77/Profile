import 'package:profile/app/enums/view_state.dart';
import 'package:profile/config/application.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AppScopedModel extends Model {
  Locale _currentLanguage;
  Locale get currentLanguage => _currentLanguage;

  ViewState _appState = ViewState.Idle;
  ViewState get appState => _appState;


  static AppScopedModel of(BuildContext context) =>
      ScopedModel.of<AppScopedModel>(context, rebuildOnChange: true);
}