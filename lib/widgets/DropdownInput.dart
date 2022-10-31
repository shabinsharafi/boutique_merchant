import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/theme.dart';
import './PrimaryInputBackground.dart';

const String DEFAULT_HINT_TEXT = "Select a value";

class _DropdownInputState extends State<DropdownInput> {
  String? selectedValue;
  String? iconUrl;
  String hintText;
  List items;

  _DropdownInputState(this.items,
      {iconUrl: null, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return PrimaryInputBackground(Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue,
        icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.expand_more, color: Color(normalWhite))),
        hint: Container(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(hintText,
                  textAlign: TextAlign.left,
                  style: textStyleDropdownInputPlaceholder)),
        ),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items
            .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                value: item.value, child: Text(item.label)))
            .toList(),
        selectedItemBuilder: (_) {
          return items
              .map((item) => Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          item.label,
                          style: textStyleDropdownInputItem,
                        )),
                  ))
              .toList();
        },
      )),
    ),width: widget.width??MediaQuery.of(context).size.width,);
  }
}

class DropdownInput extends StatefulWidget {
  final String? iconUrl;
  final VoidCallback function;
  final double? width; // add this
  final List items;
  final String hintText;

  const DropdownInput(this.hintText, this.items, this.function,
      {this.width,
      this.iconUrl,}); // change this

  @override
  _DropdownInputState createState() =>
      _DropdownInputState(this.items,
          iconUrl: this.iconUrl, hintText: this.hintText);
}
