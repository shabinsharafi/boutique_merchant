import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/theme.dart';

class PrimaryRadioButton extends StatelessWidget {
  //final String text;
  final Function() onSelected;
  double? width; // add this
  final double paddingTop;
  final double borderRadius;
  final double height;
  final double fontSize;
  final String text;
  final bool selected;
  final bool showOr;
  final EdgeInsets padding;

  PrimaryRadioButton( this.text,
      {
      required this.onSelected,
      this.selected:false,
      this.width,
      this.height: 50,
      this.borderRadius: 10,
      this.fontSize: 14,
      this.showOr: false,
      this.padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      this.paddingTop: 10});

  @override
  Widget build(BuildContext context) {
    width = width ??
        MediaQuery.of(context).size.width - normalScreenPaddingSize * 2;
    return Padding(
        padding: EdgeInsets.only(top: this.paddingTop),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Row(
                children: [

                    Container(
                      width: this.width! ,
                      decoration: BoxDecoration(
                          borderRadius: getRadius(0),
                          //gradient: index == selected ? primaryGradient : null,
                          color: selected
                              ? null
                              : Color(fadedWhiteBorder)),
                      child: InkWell(
                        onTap: selected?null:() {
                            onSelected();
                        },
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: padding,
                          decoration: BoxDecoration(
                              color: Color(backgroundGrey),
                              borderRadius: getRadius(0)),
                          child: Center(
                            child: Text(
                                /*(items[index] is MasterOption)
                                    ? items[index].label
                                    :*/ text,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                        fontSize: fontSize,
                                        fontFamily: fontFamilyRegular)
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ));
  }

  getRadius(int index) {
    return BorderRadius.horizontal(
        left: index == 0 ? Radius.circular(borderRadius) : Radius.zero,
        right:Radius.circular(borderRadius));
  }
}
