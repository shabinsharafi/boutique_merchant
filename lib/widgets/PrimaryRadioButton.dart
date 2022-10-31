import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/theme.dart';

class PrimaryRadioButton extends StatelessWidget {
  //final String text;
  final Function(int, dynamic) onSelected;
  double? width; // add this
  final double paddingTop;
  final double borderRadius;
  final double height;
  final double fontSize;
  final List items;
  final int selected;
  final bool showOr;
  final EdgeInsets padding;

  PrimaryRadioButton(
      {required this.items,
      required this.onSelected,
      this.selected: 0,
      this.width,
      this.height: 50,
      this.borderRadius: 10,
      this.fontSize: 14,
      this.showOr: false,
      this.padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      this.paddingTop: 10});

  int count = 0; // change this
  @override
  Widget build(BuildContext context) {
    count = items.length;
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
                  for (int index = 0; index < count; index++)
                    Container(
                      width: this.width! / count,
                      decoration: BoxDecoration(
                          borderRadius: getRadius(index),
                          gradient: index == selected ? primaryGradient : null,
                          color: index == selected
                              ? null
                              : Color(fadedWhiteBorder)),
                      child: InkWell(
                        onTap: index==selected?null:() {
                            onSelected(index, items[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.all(2),
                          padding: padding,
                          decoration: BoxDecoration(
                              color: Color(backgroundGrey),
                              borderRadius: getRadius(index)),
                          child: Center(
                            child: Text(
                                /*(items[index] is MasterOption)
                                    ? items[index].label
                                    :*/ items[index],
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
              if (showOr)
                for (int index = 0; index < count - 1; index++)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: (index + 1) * (width! / count) - 12,
                    right: (count - index - 1) * (width! / count) - 12,
                    child: Center(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Text("OR",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                    fontSize: fontSize - 4,
                                    fontFamily: fontFamilyRegular)
                                .copyWith(
                                    color: Color(backgroundGreyV2),
                                    fontWeight: FontWeight.w600)),
                      ),
                    ),
                  )
            ],
          ),
        ));
  }

  getRadius(int index) {
    return BorderRadius.horizontal(
        left: index == 0 ? Radius.circular(borderRadius) : Radius.zero,
        right:
            index == count - 1 ? Radius.circular(borderRadius) : Radius.zero);
  }
}
