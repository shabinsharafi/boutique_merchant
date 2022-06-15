import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  GradientMask({this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xFFC95529),
            Color(0xFFFF9C65),
            Color(0xFFC95529),
            Color(0xFFFF9C65),
            Color(0xFFC95529),
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}