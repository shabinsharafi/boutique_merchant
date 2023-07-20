import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';

class PrimaryButtonOutlined extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double? width; // add this
  final double height; // add this
  final double paddingTop;
  final EdgeInsets padding;

  const PrimaryButtonOutlined(this.text, this.function,
      {this.width,
      this.height = 51,
      this.paddingTop = 10,
      this.padding =
          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)}); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: this.paddingTop),
        child: Container(
          width: this.width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Styles.color.primaryColor,
                  Styles.color.primaryColor,
                ],
              )),
          child: Container(
            margin: EdgeInsets.all(1.5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: MaterialButton(
                minWidth: 227,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: height,
                padding: padding,
                onPressed: function,
                child: Text(text,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14, fontFamily: fontFamilyRegular)
                            .copyWith(
                                color: Styles.color.primaryColor,
                                fontWeight: FontWeight.normal)),
              ),
            ),
          ),
        ));
  }
}
