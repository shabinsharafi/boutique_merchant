import 'package:flutter/material.dart';
import 'package:boutique_merchant/styles/theme.dart';

class BackgroundImageWidget extends StatefulWidget {
  BackgroundImageWidget({
    required this.child,
    this.color = const Color(backgroundGrey),
    required this.image,
    this.fullBg,
  });

  Widget child;
  Color color;
  BGImage image;
  String? fullBg;

  @override
  _BackgroundImageWidgetState createState() => _BackgroundImageWidgetState();
}

class _BackgroundImageWidgetState extends State<BackgroundImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          color: widget.color,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if(widget.fullBg!=null)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Visibility(
                      visible: true,
                      child: Image.asset(widget.fullBg!,
                          fit: BoxFit.cover,))),
              Align(
                alignment: widget.image.alignment,
                  child: Container(
                      child: Visibility(
                          visible: true,
                          child: RotatedBox(
                            quarterTurns: widget.image.rotate,
                            child: Image.asset(widget.image.url,
                                fit: BoxFit.cover,),
                          )))),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: widget.child,
              ),
            ],
          )),
    ));
  }
}

class BGImage {
  String url;
  AlignmentGeometry alignment;
  int rotate;

  BGImage({required this.url, this.alignment = Alignment.bottomRight,this.rotate=0});
}
