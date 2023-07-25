import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width; // add this
  final double? height; // add this
  final double paddingTop;
  final bool hideShadow;
  final bool isDisabled;
  final EdgeInsets? buttonPadding;
  final IconData? icon;
  final Color? color;
  final Color? iconColor;

  const PrimaryButton(this.text, {this.onTap,
      this.width,
      this.height: 55,
      this.paddingTop: 10,
      this.hideShadow: false,
      this.isDisabled: false,
      this.buttonPadding,
      this.icon,
      this.color,
      this.iconColor}); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: this.paddingTop),
        child: Container(
          width: this.width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: hideShadow ? null : buttonShadow(),
              color: isDisabled?Colors.grey[700]:null,
              gradient: isDisabled?null:LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  color??Styles.color.primaryColor,
                  color??Styles.color.primaryColor,
                ],
              )),
          child: Material(
            elevation: 0,
            color: Colors.transparent,
            child: MaterialButton(
              minWidth: 227,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              height: height,
              padding: buttonPadding ??
                  const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: isDisabled?null:onTap,
              child: Builder(builder: (context) {
                if (icon != null) {
                  return Row(
                    children: [
                      Expanded(flex: 1, child: Icon(icon, color: iconColor)),
                      Expanded(
                        flex: 3,
                        child: Text(text,
                            //textAlign: TextAlign.center,
                            style: TextStyle(
                                    fontSize: 14, fontFamily: fontFamilyRegular)
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                      )
                    ],
                  );
                }
                return Text(text,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14, fontFamily: fontFamilyRegular)
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal));
              }),
            ),
          ),
        ));
  }
}
