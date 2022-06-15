import 'package:flutter/material.dart';

class SlideNavigation extends  PageRouteBuilder{

  Widget widget;
  SlideNavigation(this.widget) : super(
    settings: RouteSettings(
      name: widget.toString()
    ),
    transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset(0.0,0.0);
          const curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },

  );



}
