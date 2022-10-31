import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../styles/theme.dart';

enum ButtonAlignment { start, end }

class ShadowWidget extends StatelessWidget {
  final Widget? child;
  final double? width; // add this
  final double? height; // ad
  final double radius; // ad
  final BoxShape shape; // ad
  final bool hideShadow;
  final EdgeInsets padding;
  final Color color;
  final DecorationImage? decorationImage;

  const ShadowWidget({
    this.child,
    this.width,
    this.height,
    this.decorationImage,
    this.shape = BoxShape.rectangle,
    this.color =  Colors.white,
    this.radius = 0,
    this.hideShadow: false,
    this.padding: const EdgeInsets.all(0),
  }); // change this

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius:
              shape == BoxShape.circle ? null : BorderRadius.circular(radius),
          shape: shape,
          boxShadow:
              hideShadow ? null : buttonShadow(blurRadius: 16, offset: 3,opacity: 0.5),
          //shape: BoxShape.circle,
          image: decorationImage,
          color: color,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: Padding(
              padding: padding,
              child: child,
            )));
  }
}
