import 'package:flutter/material.dart';
import '../styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryInputBackground extends StatelessWidget {
  final double? width;
  final Widget child;
  const PrimaryInputBackground(this.child, {this.width}); // change this

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width??MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(backgroundBlack)),
        child: child);
  }
}
