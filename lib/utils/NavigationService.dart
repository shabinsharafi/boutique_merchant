import 'package:boutique_merchant/splashScreen.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateToLogin() {
    // changeScreenRemoveOther(context!,LoginScreen());
    SharedPreferences.getInstance().then((value) => value.clear());
    changeScreenRemoveOther(navigatorKey.currentContext!, SplashScreen());
  }

  static dynamic changeScreen(BuildContext context, Widget widget) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

// request here
  static dynamic changeScreenReplacement(BuildContext context, Widget widget) async {
    return await  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
  }

  static dynamic changeScreenRemoveOther(BuildContext context, Widget widget) async {
    return await  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget),(route) => false);

  }
  static void showAlertDialog(BuildContext context, Widget widget){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

}
