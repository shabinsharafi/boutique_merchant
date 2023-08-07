import 'package:boutique_merchant/splashScreen.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateToLogin() {
    // changeScreenRemoveOther(context!,LoginScreen());
    SharedPreferences.getInstance().then((value) => value.clear());
    changeScreenRemoveOther(SplashScreen());
  }

  static getContext() {
    return navigatorKey.currentContext!;
  }

  static dynamic changeScreen(Widget widget) async {
    return await navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

// request here
  static dynamic changeScreenReplacement(Widget widget) async {
    return await navigatorKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static dynamic changeScreenRemoveOther(Widget widget) async {
    return await navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget), (route) => false);
  }

  static dynamic close({result}) async {
    Navigator.pop(navigatorKey.currentContext!,result);
  }

  static void showAlertDialog( Widget widget) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
