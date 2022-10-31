import 'package:flutter/material.dart';
import '../styles/theme.dart';

class PrimaryIconButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback function; // add this
  const PrimaryIconButton(this.text, this.image, this.function); // change this

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFFC95529),
                  Color(0xFFFF9C65),
                  Color(0xFFC95529),
                  Color(0xFFFF9C65),
                  Color(0xFFC95529),
                ],
              )),
          child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: MaterialButton(
                minWidth: 227,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 55,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: function,
                child: Row(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0), // here is it
                    child: Image.asset(image,
                        fit: BoxFit.contain, height: 20, width: 10.4),
                  ),
                  Text(text,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontFamily: fontFamilyRegular)
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal))
                ]),
              )),
        ));
  }
}
