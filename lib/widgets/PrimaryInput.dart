import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/theme.dart';

class PrimaryInput extends StatelessWidget {
  final String placeholder;
  final String? errorText;
  final String? initialValue;
  final VoidCallback function;
  final String? Function(String?)? validator;
  final double? width; // add this
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? onSaved;
  final bool readOnly;
  const PrimaryInput(this.placeholder, this.function,
      {
        this.width,
        this.textInputType:TextInputType.text,
        this.inputFormatters,
        this.controller,
        this.validator,
        this.errorText,
        this.onChanged,
        this.onSaved,
        this.initialValue,
        this.readOnly = false,
        Key? key
      }):super(key: key); // change this

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        onChanged: onChanged,
        onTap: function,
        onSaved: onSaved,
        readOnly: readOnly,
        initialValue: initialValue,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
            filled: true,
            fillColor: Color(backgroundBlack),
            errorText: errorText,
            errorMaxLines: 2,
            border:  OutlineInputBorder(
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
