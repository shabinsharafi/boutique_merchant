import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boutique_merchant/widgets/backgroundImageWidget.dart';
import '../../constants/theme.dart';
import '../HeadingUnderline.dart';

const String DEFAULT_HINT_TEXT = "Select a value";

class _OnboardingPageState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context) {
    //rcontext = parentContext;
    var _blankFocusNode = new FocusNode();
    List<Widget> widgetsToDisplay = [
      SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      Container(
          child: Text(
        widget.title,
        style: TextStyle(
            fontSize: fontSizeHeading,
            color: Color(normalWhite),
            fontFamily: fontFamilyRegular),
        textAlign: TextAlign.center,
      )),
      HeadingUnderline(),
      SizedBox(height: 20),
    ];
    widgetsToDisplay = [...widgetsToDisplay, ...widget.widgets];

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BackgroundImageWidget(
              color: Color(backgroundGrey),
              image: BGImage(url: "assets/images/onboarding/heart_bottom_right.png"),
              child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        FocusScope.of(context).requestFocus(_blankFocusNode);
                      },
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: normalScreenPaddingSize, right: normalScreenPaddingSize),
                              child: Container(
                                  child: Column(
                                children: widgetsToDisplay,
                              )))))),
            )));
  }
}

class OnboardingPage extends StatefulWidget {
  final String title;
  final List<Widget> widgets;
  const OnboardingPage({this.title: "", this.widgets: const []}); // change this

  @override
  _OnboardingPageState createState() =>
      _OnboardingPageState();
}
