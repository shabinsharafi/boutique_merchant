import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const fontFamilyRegular = "ModernEraRegular";
const fadedWhite = 0xFF9C9FA8;
const normalWhite = 0xFFFFFFFF;
const primaryOrange = 0xFFE1953B;
const fontColorOrange2 = 0xFFF1925C;
const fontColorOrange = 0xFFD3663B;
const fontColorBlack = 0xFF141A2D;
const fadedWhiteBorder = 0xFF343D54;
const promptBlue = 0xFF394669;
const graphGrey = 0xFF909DC1;
const iconBlueTint = 0xFF455275;
const notificationRed = 0xFFFF000F;
const backgroundGrey = 0xFF262D40;
const backgroundGreyV2 = 0xFF1A2135;
const backgroundGreyV3 = 0xFF2C3650;
const backgroundBlack = 0xFF1A2135;
const profileCardBg = 0xFF141B30;
const boxBorder = 0xFF30394A;
const borderRadiusNormal = 10.0;
const lineHeightNormal = 1.5;
const lineHeightHeadings = 1.2;
const fontSizeTransparentButton = 12.0;
const normalScreenPaddingSize = 25.0;
const fontSizeExtraSmall = 10.0;
const fontSizeSmall = 12.0;
const fontSizeNormal = 16.0;
const fontSizeOptions = 14.0;
const fontSizeHeading = 24.0;
const fontSizeAlertHeading = 18.0;
const fontSizeTitle = 20.0;
const fontSizeSplashHeading = 40.0;
const fontSizeArrowButton = 20.0;
const normalScreenPadding =
    EdgeInsets.symmetric(horizontal: normalScreenPaddingSize);
const Gradient primaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFFC95529),
    Color(0xFFFF9C65),
    Color(0xFFC95529),
    Color(0xFFFF9C65),
    Color(0xFFC95529),
  ],
);

List<BoxShadow>? buttonShadow({double blurRadius = 23, double offset = 7, double opacity = 0.7}) {
  return <BoxShadow>[
    BoxShadow(
      color: Color(0xFF4E5978).withOpacity(opacity-0.11),
      blurRadius: blurRadius,
      offset: Offset(-offset, -offset),
    ),
    BoxShadow(
      color: Color(0xFF121A30).withOpacity(opacity),
      blurRadius: ((blurRadius + 1) * 2 / 3) + 1,
      offset: Offset((offset - 1) * 2, (offset - 1) * 2),
    ),
  ];
}

InputDecoration textInputDecoration = InputDecoration(
    fillColor: Color(backgroundBlack),
    contentPadding: const EdgeInsets.all(10.0),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none
),
    hintStyle: textStyleHintText);

var textStyleHintText = TextStyle(
    fontSize: fontSizeSmall,
    color: Color(fadedWhite),
    fontFamily: fontFamilyRegular);
var textStyleNormal = TextStyle(
    fontSize: fontSizeNormal,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.5);
var textStyleSmall = TextStyle(
    fontSize: fontSizeSmall,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.5);
var textStyleOptionsButton = TextStyle(
    fontSize: fontSizeOptions,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.5);
var textStyleAlertHeading = TextStyle(
    fontSize: fontSizeAlertHeading,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.5);
var textStyleAnswers = TextStyle(
    fontSize: 25,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.5);

var textStyleSplashHeading = TextStyle(
    fontSize: fontSizeSplashHeading,
    fontFamily: fontFamilyRegular,
    color: Color(normalWhite),
    height: 1.2);

var textStyleArrowButton = TextStyle(
  fontSize: fontSizeArrowButton,
  fontFamily: fontFamilyRegular,
  color: Color(normalWhite),
);

var textStyleTransparentButton = TextStyle(
  fontSize: fontSizeTransparentButton,
  fontFamily: fontFamilyRegular,
  color: Color(normalWhite),
);

var textStylePlaceholder = TextStyle(
  fontSize: fontSizeOptions,
  fontFamily: fontFamilyRegular,
  color: Color(boxBorder),
);

var textStyleFadedBlue = TextStyle(
  fontSize: fontSizeOptions,
  fontFamily: fontFamilyRegular,
  color: Color(fadedWhite),
  height: 1.5
);

var textStyleDropdownInputPlaceholder = TextStyle(
  fontSize: fontSizeTransparentButton,
  fontFamily: fontFamilyRegular,
  color: Color(fadedWhite),
);

var textStyleDropdownInputItem = TextStyle(
  fontSize: fontSizeTransparentButton,
  fontFamily: fontFamilyRegular,
  color: Color(normalWhite),
);
 errorStyle(var context)=>TextStyle(
color: Theme.of(context).errorColor,
fontSize: 12);


const dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";