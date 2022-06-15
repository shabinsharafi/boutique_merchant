import 'package:flutter/material.dart';

class Styles {

  static double buttonHeight=50;



  static getBackGroundColor() {
    return Color.fromARGB(40, 255, 255, 255);
  }

  static getDialogBackground() {
    return primaryColor;
  }

  static getTextFieldDecoration({String hint = ""}) {
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

  static getButtonDecoration({double radius = 15, double width = 2, Color color = Colors.white70}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: width, color:color ));
  }

  static getButtonDecoration2({double radius = 15, double width = 2, Color color = Colors.white}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: width, color: color),
        color: color);
  }

  static getTextColor() {
    return Colors.white70;
  }

  static var primaryColor = MaterialColor(
    0xFF081046,
    <int, Color>{
      50: Color(0xFF081046),
      100: Color(0xFF081046),
      200: Color(0xFF081046),
      300: Color(0xFF081046),
      400: Color(0xFF081046),
      500: Color(0xFF081046),
      600: Color(0xFF081046),
      700: Color(0xFF081046),
      800: Color(0xFF081046),
      900: Color(0xFF081046),
    },
  );
  static const accentColor = Color.fromARGB(255, 241, 212, 80);
  static const blueColor = Color.fromARGB(255, 35, 70, 116);
  static const skyBlueColor = Color.fromARGB(255, 71, 194, 202);
  static const redColor = Color.fromARGB(255, 230, 96, 101);

  static getNoImageDecoration(){
    return DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.fill);
  }
}
