import 'package:flutter/material.dart';

class AppBarHelper {
  static build({Widget title, List<Widget> actions, Widget leading}) {
    if (leading == null) {
      return AppBar(
          title: title, centerTitle: true, elevation: 0, actions: actions);
    }

    return AppBar(
        title: title,
        centerTitle: true,
        elevation: 0,
        actions: actions,
        leading: leading,
        automaticallyImplyLeading: false
    );
  }
}
