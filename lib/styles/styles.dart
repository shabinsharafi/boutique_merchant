import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:flutter/material.dart';

class Styles {

  //colors
  static final primaryColor = Utilities.getMaterialColor(Color(0xFFeb5757));
  static const accentColor = Color.fromARGB(255, 241, 212, 80);
  static const blueColor = Color.fromARGB(255, 35, 70, 116);
  static const skyBlueColor = Color.fromARGB(255, 71, 194, 202);
  static const redColor = Color.fromARGB(255, 230, 96, 101);
  static const textColor = Colors.white70;
  static const fadedWhite = Color(0xFF9C9FA8);
  static const normalWhite = Color(0xFFFFFFFF);
  static const primaryOrange = Color(0xFFE1953B);
  static const fontColorOrange2 = Color(0xFFF1925C);
  static const fontColorOrange = Color(0xFFD3663B);
  static const fontColorBlack = Color(0xFF141A2D);
  static const fadedWhiteBorder = Color(0xFF343D54);
  static const promptBlue = Color(0xFF394669);
  static const graphGrey = Color(0xFF909DC1);
  static const iconBlueTint = Color(0xFF455275);
  static const notificationRed = Color(0xFFFF000F);
  static const backgroundGrey = Color(0xFF262D40);
  static const backgroundGreyV2 = Color(0xFF1A2135);
  static const backgroundGreyV3 = Color(0xFF2C3650);
  static const backgroundBlack = Color(0xFF1A2135);
  static const profileCardBg = Color(0xFF141B30);
  static const boxBorder = Color(0xFF30394A);
  static const backGroundColor = Color.fromARGB(40, 255, 255, 255);

  //decorations
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

  static getNoImageDecoration(){
    return DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.fill);
  }

  //textStyles
  static const fontFamilyRegular = "ModernEraRegular";
  static var textStyleTitle= TextStyle(
    fontSize: Dimens.fontSizeTitle,
    fontFamily: fontFamilyRegular,
    color: textColor,
  );
}
