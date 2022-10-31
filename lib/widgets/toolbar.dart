import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:boutique_merchant/styles/theme.dart';
import 'package:boutique_merchant/widgets/ArrowButton.dart';

import 'GradientMask.dart';

class ToolBar extends StatelessWidget {
  ToolBar(this.title, {this.action, Key? key}) : super(key: key);
  String title;
  Widget? action;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.5),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Color(backgroundGreyV2),
              child: GradientMask(
                child: SvgPicture.asset(
                  "assets/images/common/arrow_right.svg",
                  height: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 55,
          child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: fontSizeTitle,
                      color: Color(normalWhite),
                      fontFamily: fontFamilyRegular),
                  textAlign: TextAlign.center,
                )),
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(child: action ?? SizedBox())),
      ],
    );
  }
}
