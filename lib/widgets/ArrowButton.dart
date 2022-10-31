import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';

enum ButtonAlignment { start, end }

class ArrowButton extends StatelessWidget {
  final String? text;
  final String imageUrl;
  final VoidCallback function;
  final ButtonAlignment alignment;
  final double width; // add this
  final double paddingTop;
  final bool hideShadow;
  final EdgeInsets margin;
  final bool showButton;

  const ArrowButton(this.text, this.imageUrl, this.function,
      {this.width: 308,
      this.paddingTop: 10,
      this.hideShadow: false,
      this.showButton = false,
      this.margin: const EdgeInsets.all(0),
      this.alignment: ButtonAlignment.end}); // change this

  @override
  Widget build(BuildContext context) {
  // if(Navigator.of(context).canPop() && showButton)
    if(showButton || Navigator.of(context).canPop() )
    return Container(
        margin: margin,
        child: Row(
          mainAxisAlignment: alignment == ButtonAlignment.end
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: function,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  text != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(text!,
                              textAlign: TextAlign.center,
                              style: textStyleArrowButton))
                      : SizedBox(),
                  Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: hideShadow
                            ? null
                            : buttonShadow(blurRadius: 16, offset: 3),
                        shape: BoxShape.circle,
                        color: Color(backgroundGreyV2),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Image.asset(
                          this.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
    return Container();
  }
}
