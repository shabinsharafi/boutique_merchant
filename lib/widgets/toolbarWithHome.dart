import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boutique_merchant/constants/theme.dart';
import 'package:boutique_merchant/widgets/ArrowButton.dart';
import 'package:boutique_merchant/widgets/GradientMask.dart';

class ToolBarWithHome extends StatelessWidget {
  ToolBarWithHome(this.title, {Key? key, this.isCenter = false})
      : super(key: key);
  String title;
  bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isCenter)
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
            ),
          Expanded(
            child: Column(
              mainAxisAlignment:
                  isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              crossAxisAlignment: isCenter
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 35,
                      color: Color(normalWhite),
                      fontFamily: fontFamilyRegular),
                  textAlign: isCenter?TextAlign.center:null,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Color(backgroundGreyV2),
              child: GradientMask(
                child: SvgPicture.asset(
                  "assets/images/common/home_dash.svg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
