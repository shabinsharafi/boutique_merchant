import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnPressed = void Function(dynamic);

const double DEFAULT_WIDTH = 308;
const String DEFAULT_TEXT = "Submit";
const double DEFAULT_PADDING_TOP = 10;
const int DEFAULT_NON_SELECTED_TEXT_COLOR = normalWhite;
const int DEFAULT_NON_SELECTED_ICON_COLOR = normalWhite;
const String DEFAULT_IS_SELECTED = "";
const String DEFAULT_ICON_URL = "";
OnPressed DEFAULT_ON_PRESSED = (boolisSelected) {};

class IconWithText extends StatelessWidget {
  final String text;
  final String iconUrl;
  final double width; // add this
  final double paddingTop;
  final int defaultTextColor;
  final int defaultIconColor;
  String selected;

  IconWithText(
    this.text,
    this.iconUrl, {
    this.width: DEFAULT_WIDTH,
    this.paddingTop: DEFAULT_PADDING_TOP,
    this.defaultTextColor: DEFAULT_NON_SELECTED_TEXT_COLOR,
    this.defaultIconColor: DEFAULT_NON_SELECTED_ICON_COLOR,
    this.selected: DEFAULT_IS_SELECTED,
  });

  @override
  Widget build(BuildContext context) {
    renderButton() {
      var textColor = defaultTextColor;
      var iconColor = defaultIconColor;
      print(selected);
      var textStyle = textStyleTransparentButton;
      textStyle =
          textStyle.merge(TextStyle(color: Color(textColor), fontSize: 14));
      return <Widget>[
        Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            // child: Image.asset(
            //   this.iconUrl,
            //   fit: BoxFit.contain,
            // )),

            child: iconUrl.endsWith("svg")
                ? SvgPicture.asset(this.iconUrl, color: Color(iconColor))
                : Image.asset(this.iconUrl, color: Color(iconColor))),
        Flexible(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(text, textAlign: TextAlign.start, style: textStyle)),
        )
      ];
    }

    return Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: renderButton(),
          ),
        ));
  }
}
