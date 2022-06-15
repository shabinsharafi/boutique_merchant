import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utilities {
  static const String baseUrl = "http://192.168.0.6:3000/";

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

  static getTextFieldDecoration({required String hint}) {
    return InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              color: Color.fromARGB(0, 255, 255, 255),
              width: 1.0,
              style: BorderStyle.solid),
        ),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Color.fromARGB(30, 255, 255, 255),
        filled: true);
  }

  static getTextColor() {
    return Colors.white70;
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
}
