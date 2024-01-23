import 'package:flutter/material.dart';
import 'package:watch_store/route/names.dart';
import 'package:watch_store/screens/auth/send_sms_screen.dart';
import 'package:watch_store/screens/auth/verify_code_screen.dart';
import 'package:watch_store/screens/mainscreen/main_screen.dart';
import 'package:watch_store/screens/mainscreen/product_list_screen.dart';
import 'package:watch_store/screens/mainscreen/product_single_screen.dart';
import 'package:watch_store/screens/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.sendSmsScreen : (context) => SendSmsScreen(),
  ScreenNames.verifyCodeScreen : (context) => VerifyCodeScreen(),
  ScreenNames.registerScreen : (context) => RegisterScreen(),
  ScreenNames.mainScreen : (context) => MainScreen(),
  ScreenNames.productListScreen : (context) => const ProductListScreen(),
  ScreenNames.productSingleScreen : (context) => const ProductSingleScreen(),
};