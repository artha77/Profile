import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalPopupHelper {
  static Future<dynamic> showAndroid(
      BuildContext context,
      {List<Widget> actions}
      ) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: new Wrap(
                children: actions
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> showIos(
      BuildContext context,
      {
        List<CupertinoActionSheetAction> actions,
        CupertinoActionSheetAction cancelButton
      }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
          actions: actions,
          cancelButton: cancelButton
      ),
    );
  }
}