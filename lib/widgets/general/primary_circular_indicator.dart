import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';

class PrimaryCircularIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Color(primaryOrange),
    );
  }
}
