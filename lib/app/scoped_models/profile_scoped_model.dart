import 'dart:io';

import 'package:profile/app/enums/view_state.dart';
import 'package:profile/app/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileScopedModel extends Model {

  ViewState _appState = ViewState.Idle;
  ViewState get appState => _appState;

  bool get notifications => _profile.wantNotification;

  bool get CGU => _profile.hasAcceptedCGU;

  Profile _profile = Profile();
  Profile get profile => profile;

  File get avatar => _profile.avatar;

  void setNotifications(bool state) {
    _profile.wantNotification = state;
    notifyListeners();
  }

  void setCGU(bool state) {
    _profile.hasAcceptedCGU = state;
    notifyListeners();
  }

  void setAvatar(File file) {
    _profile.avatar = file;
    notifyListeners();
  }


  static ProfileScopedModel of(BuildContext context) =>
      ScopedModel.of<ProfileScopedModel>(context, rebuildOnChange: true);
}