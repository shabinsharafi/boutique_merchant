import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:boutique_merchant/styles/theme.dart';
import 'package:boutique_merchant/widgets/ArrowButton.dart';

import 'GradientMask.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  ToolBar(this.title, {this.action,this.color,this.isLight=true, Key? key}) : super(key: key);
  String title;
  Color? color;
  Widget? action;
  bool isLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:color??Styles.color.primaryColor,
      child: SafeArea(
        bottom: false,
        top: true,
        child: Stack(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(color: color??Styles.color.primaryColor),
              child: Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      title,
                      style: Styles.textStyle.headingTS
                          .copyWith(color: isLight?Colors.white:Colors.black87),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.5),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: isLight?Colors.white:Colors.black87,
                  ),
                ),
              ),
            ),
            Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(child: action ?? SizedBox())),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(60, 60);
}
