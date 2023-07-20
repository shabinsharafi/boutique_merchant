import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';

class PrimaryOutline extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? width; // add this
  final double? height; // add
  final double radius; // add

  const PrimaryOutline(
      {this.width,
      this.onTap,
      this.height,
      this.radius=10,
      this.child}); // change this

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Colors.black87,width: 1)),
        child: Center(child: child),
      ),
    );
  }
}
