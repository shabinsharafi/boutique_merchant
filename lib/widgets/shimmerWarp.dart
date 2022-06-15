import 'package:boutique_merchant/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrap extends StatelessWidget {
  ShimmerWrap({required this.child, Key? key}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(fadedWhite).withOpacity(0.4),
      highlightColor: Color(fadedWhite).withOpacity(0.6),
      child: child,
    );
  }
}
