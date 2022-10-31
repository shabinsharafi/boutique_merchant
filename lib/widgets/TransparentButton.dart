import 'package:flutter/material.dart';
import '../styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnPressed = void Function(dynamic);

const double DEFAULT_WIDTH = 308;
const String DEFAULT_TEXT = "Submit";
const double DEFAULT_PADDING_TOP = 10;
const int DEFAULT_NON_SELECTED_TEXT_COLOR = fadedWhite;
const int DEFAULT_NON_SELECTED_ICON_COLOR = fadedWhite;
const int DEFAULT_SELECTED_TEXT_COLOR = fontColorOrange;
const int DEFAULT_SELECTED_ICON_COLOR = fontColorOrange;
const String DEFAULT_IS_SELECTED = "";
const String DEFAULT_ICON_URL = "";
OnPressed DEFAULT_ON_PRESSED = (boolisSelected) {};

class TransparentButton extends StatelessWidget {
  final String text;
  final String iconUrl;
  final OnPressed onPressed;
  final double width; // add this
  final double paddingTop;
  final int defaultTextColor;
  final int defaultIconColor;
  final int selectedTextColor;
  final int selectedIconColor;
  dynamic selected;
  dynamic value;

  TransparentButton(
    this.text,
    this.iconUrl,
    this.onPressed, {
    this.width: DEFAULT_WIDTH,
    this.paddingTop: DEFAULT_PADDING_TOP,
    this.defaultTextColor: DEFAULT_NON_SELECTED_TEXT_COLOR,
    this.defaultIconColor: DEFAULT_NON_SELECTED_ICON_COLOR,
    this.selectedIconColor: DEFAULT_SELECTED_ICON_COLOR,
    this.selectedTextColor: DEFAULT_SELECTED_TEXT_COLOR,
    this.selected: DEFAULT_IS_SELECTED,
    this.value: DEFAULT_IS_SELECTED,
  });

  @override
  Widget build(BuildContext context) {
    renderButton() {
      var textColor = defaultTextColor;
      var iconColor = defaultIconColor;
      print(selected);
      if (this.selected==this.value) {
        textColor = selectedTextColor;
        iconColor = selectedIconColor;
      }
      var textStyle = textStyleTransparentButton;
      textStyle = textStyle.merge(TextStyle(color: Color(textColor)));
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

            child: SvgPicture.asset(this.iconUrl, color: Color(iconColor))),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(text, textAlign: TextAlign.center, style: textStyle))
      ];
    }

    onButtonPressed() {
      print("Setting state");
      onPressed(this.value);
      //isSelected = !isSelected;
      // renderButton();
    }

    return Container(
        color: Colors.transparent,
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: MaterialButton(
            padding: EdgeInsets.only(left: 5, right: 5),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: onButtonPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: renderButton(),
            ),
          ),
        ));
  }
}
