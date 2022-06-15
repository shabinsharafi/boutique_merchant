import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showResult(GlobalKey<ScaffoldState> scaffoldKey, String text) {
    if (scaffoldKey.currentState != null) {
      ScaffoldMessenger.maybeOf(scaffoldKey.currentContext!)!.showSnackBar(
          SnackBar(duration: const Duration(seconds: 1), content: Text(text)));
    } else {
      print(text);
    }
  }

  static void showToast(BuildContext context, String text) {
    ScaffoldMessenger.maybeOf(context)!.showSnackBar(
        SnackBar(duration: const Duration(seconds: 1), content: Text(text)));
  }
}
