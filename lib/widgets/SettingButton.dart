import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';

enum ButtonAlignment { start, end }

class SettingsButton extends StatelessWidget {
  final String? text;
  final String imageUrl;
  final VoidCallback function;
  final ButtonAlignment alignment;
  final double width; // add this
  final double paddingTop;
  final bool hideShadow;

  const SettingsButton(this.text,  this.function,
      {this.width: 308,this.imageUrl="",
      this.paddingTop: 10,
      this.hideShadow: false,
      this.alignment: ButtonAlignment.end}); // change this

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: InkWell(
          onTap: function,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: 50,
                  height: 50,
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Image.asset(
                      this.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  )),
              text != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      child: Text(text!,
                          textAlign: TextAlign.center,
                          style: Styles.textStyle.normalTS))
                  : SizedBox(),
              Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Icon(Icons.chevron_right_sharp),
              ),
            ],
          ),
        ));
    return Container();
  }
}
