import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/utils/extension.dart';
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

  PrimaryRadioButton(this.text,
      {required this.onSelected,
      this.selected: false,
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
        child: InkWell(
          onTap: selected
              ? null
              : () {
                  onSelected();
                },
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selected
                        ? Styles.color.primaryColor
                        : Colors.transparent,
                    width: selected ? 1 : 0),
                borderRadius: getRadius(0)),
            child: Stack(
              children: [
                Row(
                  children: [
                    selected
                        ?Icon(Icons.radio_button_on,color: Styles.color.primaryColor,):
                    Icon(Icons.radio_button_off),
                    SizedBox(width: 20,),
                    Center(
                      child: Text(
                          /*(items[index] is MasterOption)
                                ? items[index].label
                                :*/
                          text,
                          textAlign: TextAlign.center,
                          style: Styles.textStyle.regularTS),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  getRadius(int index) {
    return BorderRadius.horizontal(
        left: index == 0 ? Radius.circular(borderRadius) : Radius.zero,
        right: Radius.circular(borderRadius));
  }
}
