import 'package:flutter/material.dart';
import 'package:watch_store/res/dimens.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.medium),
      ),
    ),
  );
  static ButtonStyle secondaryButtonStyle(Color color) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            (AppDimens.small),
          ),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(color),
    );
  }
}
