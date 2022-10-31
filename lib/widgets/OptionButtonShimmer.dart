import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:boutique_merchant/styles/theme.dart';

class OptionButtonShimmer extends StatelessWidget {
  OptionButtonShimmer({this.width});

  double? width;

  @override
  Widget build(BuildContext context) {
    print((width??MediaQuery.of(context).size.width));
    var textWidth=((width??MediaQuery.of(context).size.width) / 4) +
        Random().nextInt(((width??MediaQuery.of(context).size.width) / 4).floor());
    print(textWidth);
    if(textWidth.isNegative){
      textWidth+=80;
      print(textWidth);
    }
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(fadedWhiteBorder), width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(width: textWidth,
              height: 16,
              color: Color(fadedWhiteBorder).withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
