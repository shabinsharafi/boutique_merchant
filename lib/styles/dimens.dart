import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:flutter/material.dart';

class Dimens {
  static const double buttonHeight=50;
  static const double screenPadding=25;
  static final screenWidth= MediaQuery.of(NavigationService.getContext()).size.width;
  static final screenHeight= MediaQuery.of(NavigationService.getContext()).size.height;

  static const borderRadiusNormal = 10.0;
  static const lineHeightNormal = 1.5;
  static const lineHeightHeadings = 1.2;
  static const fontSizeExtraSmall = 10.0;
  static const fontSizeSmall = 12.0;
  static const fontSizeOptions = 14.0;
  static const fontSizeNormal = 16.0;
  static const fontSizeAlertHeading = 18.0;
  static const fontSizeTitle = 20.0;
  static const fontSizeHeading = 24.0;
  static const fontSizeLarge = 30.0;
  static const fontSizeExtraLarge = 40.0;
}
