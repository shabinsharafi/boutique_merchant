import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/theme.dart';

class PrimaryRoundIconButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback? function; // add this
  const PrimaryRoundIconButton(this.text, this.image, this.function); // change this

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Color(backgroundGreyV2)
              ),
          child: InkWell(
            onTap: function,
              child: Container(
                padding: EdgeInsets.all(16),
                child: image.endsWith("svg")? SvgPicture.asset(image,
                    fit: BoxFit.contain, height: 20, width: 10.4): Image.asset(image,
                    fit: BoxFit.contain, height: 20, width: 10.4),
            ),
          ),
        ),SizedBox(height: 10,),Text(text,
            textAlign: TextAlign.center,
            style:
            TextStyle(fontSize: 14, fontFamily: fontFamilyRegular)
                .copyWith(
                color: Color(fadedWhite),
                fontWeight: FontWeight.w400))
      ],
    );
  }
}
