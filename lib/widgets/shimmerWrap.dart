import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrap extends StatelessWidget {
  ShimmerWrap({ this.child, Key? key}) : super(key: key);

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(fadedWhite).withOpacity(0.4),
      highlightColor: Color(fadedWhite).withOpacity(0.6),
      child: child??ShimmerBox(),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  ShimmerBox({this.height, this.width,this.radius, Key? key}) : super(key: key);
  double? height;
  double? width;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width??Styles.dimens.width,
      decoration: BoxDecoration(color:Color(fadedWhite),borderRadius: BorderRadius.circular(radius??10)),
    );
  }
}
