import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utilities {
  static const String baseUrl = "http://192.168.0.104:3000/";
  // static const String baseUrl = "https://1f26-86/-99-67-240.ngrok.io/"; //ngrok

  static void showToast(BuildContext context, String message) {

    AlertDialog alertDialogBox = AlertDialog(
      content: Container(
        child: Text(message),
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogBox;
      },
    );
  }

/*
Snack bar
  static void showToast(BuildContext context, String message) {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text(message),
    ));
  }

  static void showToastFromKey(
      GlobalKey<ScaffoldState> _context, String message) {
    _context.currentState.removeCurrentSnackBar();
    _context.currentState.showSnackBar(new SnackBar(
      content: new Text(message),
    ));
  }
*/

  static MaterialColor getMaterialColor(Color color) {
    List strengths = <double> [0.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1, len = 9; i <= len; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    });

    return MaterialColor(color.value, swatch);
  }

  /*static void showDialog(BuildContext context) {
    */ /*return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit this App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;*/ /*
  }*/

  static String getLocation(String loc) {
    List<String> locs = loc.split(",");
    return locs[0] + ", " + locs[locs.length - 1];
  }

  static String formatAge(int age) {
    int month = age % 12;
    int year = age ~/ 12;
    String ageVa = "";
    if (year != 0) ageVa += year.toString() + " Yrs";
    if (month != 0) ageVa += month.toString() + " Mons";
    if (year != 0 && month != 0) {
      ageVa = ageVa.replaceAll("Yrs", "Yrs & ");
    }
    return ageVa;
  }
  static List<String> petType = ['Male', 'Female', 'Pair', 'Any'];
  static List<IconData> petIcon = [FontAwesomeIcons.venus, FontAwesomeIcons.mars, FontAwesomeIcons.venusMars, FontAwesomeIcons.genderless];

  static String asset(String s) {
    return "assets/images/$s";
  }
}
