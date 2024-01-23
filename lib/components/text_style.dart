import 'package:flutter/material.dart';
import 'package:watch_store/gen/fonts.gen.dart';
import 'package:watch_store/res/colors.dart';

class LightModeTextStyle {
  LightModeTextStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title,
  );
  static const TextStyle selectedTab = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title,
  );
  static TextStyle unSelectedTab = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.title.withAlpha(125),
  );
  static const TextStyle tagTitle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: Colors.white,
  );
  static const TextStyle amazingStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 22,
      color: LightAppColors.amazingColor,
      fontWeight: FontWeight.w700);
  static const TextStyle productTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      color: LightAppColors.title,
      fontWeight: FontWeight.normal);
  static TextStyle caption = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 13,
      color: LightAppColors.title.withAlpha(150),
      fontWeight: FontWeight.normal);
  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.hint,
  );
  static const TextStyle avatarText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: LightAppColors.title,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle oldPriceStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      color: LightAppColors.oldPriceColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
      decorationThickness: 5);
  static const TextStyle productTimerStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: Colors.blue,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle mainButton = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: LightAppColors.mainButtonTextColor,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle primaryThemeTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 15,
    color: LightAppColors.primaryColor,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle btmNavActiveTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColors.btmNavActiveColor,
  );
  static const TextStyle btmNavInActiveTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: LightAppColors.btmNavInActiveColor,
  );
  static const TextStyle discountTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: LightAppColors.discountColor,
  );
}
