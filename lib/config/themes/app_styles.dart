import 'package:flutter/material.dart';
import 'package:flutter_starter/config/themes/pallete.dart';
import 'package:flutter_starter/config/themes/themes.dart';

class AppStyle {
  static getBorderTextFieldStyle() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ); //Material
  }

  static getEnabledBorderTextFieldStyle() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ); //Material
  }

  static getDisabledBorderTextFieldStyle() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      borderSide: BorderSide(width: 1, color: Palette.lightGrey),
    );
  }

  static getValidationMessageStyle() {
    return const TextStyle(
      color: Colors.redAccent,
      fontSize: TextSize.medium,
    );
  }

  static getButtonBorderStyle() {
    return ElevatedButton.styleFrom(
      primary: Colors.white,
      onPrimary: Palette.ff18a0fb,
      onSurface: Palette.ff18a0fb,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Palette.ff18a0fb,
        ),
      ),
    );
  }

  static getTableCellBorderSideStyle() {
    return const BorderSide(color: Colors.grey, width: 1);
  }
}
