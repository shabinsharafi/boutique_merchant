import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class AnimatedButtonLoader extends StatelessWidget {
  AnimatedButtonLoader(
      {this.child = const SizedBox(),
      this.loading = false,
      this.width,
      this.height = 55,
      this.paddingTop = 0,
      this.hideShadow = false,
      Key? key})
      : super(key: key);

  final double? width; // add this
  final double height; // add this
  final double paddingTop;
  final bool hideShadow;
  Widget child;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: loading?height:width??Styles.dimens.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(loading?(height/2):10),
              boxShadow: hideShadow ? null : buttonShadow(),
              gradient:LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Styles.color.primaryColor,
                  Styles.color.primaryColor,
                  Styles.color.primaryColor,
                  Styles.color.primaryColor,
                  Styles.color.primaryColor,
                ],
              )),
          child: loading
              ? Container(
                  height: height,
                  //width: width ?? MediaQuery.of(context).size.width,
                  child: Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 3,)))
              : child,
        ),
      ),
    );
  }
}
