import 'package:boutique_merchant/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  TabButton(
      {this.selectedTab,
      required this.onSelected,
      required this.items,
      this.width,
      this.animationTime=300,
      this.height});

  var selectedTab;
  var borderRadius = 30.0;
  Function(int) onSelected;
  int animationTime;
  double? height;
   double? width;
  late BoxDecoration _selectedDecoration;
  late BoxDecoration _unselectedDecoration;

  List<String> items;

  @override
  Widget build(BuildContext context) {
    width = width??MediaQuery.of(context).size.width;
    _selectedDecoration = BoxDecoration(
      gradient: primaryGradient,
      borderRadius: BorderRadius.only(topRight: Radius.circular(borderRadius)),
    );
    _unselectedDecoration = BoxDecoration(
      color: Color(fadedWhiteBorder),
      borderRadius: BorderRadius.only(topRight: Radius.circular(borderRadius)),
    );
    return AnimatedContainer(
      duration: Duration(milliseconds: animationTime),
      width: width,
      child: Container(
        height: height,
        child: Stack(
          children: [
            for (int i = 4; i > 0; i--) buildTabs(i),
          ],
        ),
      ),
    );
  }

  buildTabs(int i) {
    return AnimatedContainer(
      duration: Duration(milliseconds: animationTime),
      width: width! * i / 4,
      child: Container(
        width: width! * i / 4,
        height: height,
        decoration:
            selectedTab == i ? _selectedDecoration : _unselectedDecoration,
        child: InkWell(
          onTap: () {
            onSelected(i);
          },
          child: Container(
            margin: const EdgeInsets.only(
              right: 2,
              top: 2,
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color:
                  Color(selectedTab != i ? fadedWhiteBorder : backgroundGreyV2),
              borderRadius:
                  BorderRadius.only(topRight: Radius.circular(borderRadius)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: width! * (i - 1) / 4),
              child: Center(
                  child: FittedBox(
                      child: Text(
                items[i - 1],
                style: selectedTab == i
                    ? textStyleOptionsButton
                    : textStyleOptionsButton.copyWith(color: Color(fadedWhite)),
                textAlign: TextAlign.center,
              ))),
            ),
          ),
        ),
      ),
    );
  }
}
