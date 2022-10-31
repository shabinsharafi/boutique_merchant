import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './PrimaryInputBackground.dart';

class PrimaryIconInput extends StatelessWidget {
  final String placeholder;
  final String? errorText;
  final String iconUrl;
  final VoidCallback function;
  final String? Function(String?)? validator;
  final double? width; // add this
  final double iconWidth;
  final double iconHeight;
  final double contentPadding;
  final double iconPadding;
  final bool isIconSvg;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final int svgIconColor;
  const PrimaryIconInput(this.placeholder, this.iconUrl, this.function,
      {this.width,
      this.iconWidth: 25,
      this.iconHeight: 15,
      this.contentPadding: 20.0,
      this.iconPadding: 15.0,
      this.isIconSvg: false,
      this.readOnly: false,
      this.textInputType:TextInputType.text,
      this.inputFormatters,
      this.controller,
      this.validator,
      this.errorText,
      this.svgIconColor = fadedWhite}); // change this
  renderImage() {
    if (!isIconSvg) {
      return Image.asset(
        this.iconUrl,
        width: this.iconWidth,
        height: this.iconHeight,
        fit: BoxFit.fill,
      );
    } else {
      return SvgPicture.asset(this.iconUrl,
          color: Color(svgIconColor),
          width: this.iconWidth,
          height: this.iconHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
          onTap: function,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(backgroundBlack),
                errorText: errorText,
                errorMaxLines: 3,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(this.iconPadding),
                  child: renderImage(),
                ),
                contentPadding: EdgeInsets.all(this.contentPadding),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                hintText: this.placeholder,
                hintStyle: TextStyle(
                    fontSize: fontSizeSmall,
                    color: Color(fadedWhite),
                    fontFamily: fontFamilyRegular)),
            style: TextStyle(
                fontSize: fontSizeSmall,
                color: Color(normalWhite),
                fontFamily: fontFamilyRegular));

  }
}
