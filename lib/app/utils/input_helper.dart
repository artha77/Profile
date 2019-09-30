import 'package:flutter/material.dart';
import 'package:profile/config/application.dart';
import 'package:profile/config/theme_colors.dart';

class InputHelper {
  static textFormField({String hint, Function onSaved, Function validate}) {
    return TextFormField(
      style: TextStyle(color: ThemeColors.SecondaryColor, fontSize: Application.screen.setSp(14)),
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      decoration:_buildDecoration(hint),
      onSaved: onSaved,
      validator: validate,
    );
  }

  static OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
    );
  }

  static OutlineInputBorder _buildEnabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    );
  }

  static OutlineInputBorder _buildRegularBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.solid,
      ),
    );
  }

  static InputDecoration _buildDecoration(String hint) {
    return InputDecoration(
      enabledBorder: _buildEnabledBorder(),
      focusedBorder: _buildFocusedBorder(),
      hintText: hint,
      hintStyle: TextStyle(
          fontSize: Application.screen.setSp(16),
          color: ThemeColors.SecondaryColor,
          fontWeight: FontWeight.w300),
      border: _buildRegularBorder(),
      contentPadding: EdgeInsets.only(
          top: Application.screen.setHeight(10),
          bottom: Application.screen.setHeight(10),
          left: Application.screen.setWidth(20),
          right: Application.screen.setWidth(5)
      ),
    );
  }
}
