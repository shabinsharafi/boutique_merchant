import 'package:flutter/material.dart';

class ImageDropDown extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width; // add this
  const ImageDropDown(this.text, this.function,
      {this.width: 308}); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
            width: this.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Column(
                    children: <Widget>[Image.asset(''), Text(value)],
                  ),
                );
              }).toList(),
              onChanged: (_) {},
            )));
  }
}
