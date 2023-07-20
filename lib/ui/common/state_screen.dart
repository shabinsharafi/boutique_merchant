import 'dart:collection';

import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
abstract class ScreenWidget extends StatefulWidget {
  ScreenWidget({Key? key}) : super(key: key);
  BuildContext? _context;

  @override
  ScreenState<ScreenWidget> createState() {
    return getState();
  }

  ScreenState getState();

  void openScreen(Widget widget, {HashMap? args, bool forceNew = false}) {
    NavigationService.changeScreen(widget);
  }
}

abstract class ScreenState<T extends ScreenWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    widget._context = context;
    return SafeArea(
        child: WillPopScope(
            onWillPop: () async {
              onBackPressed();
              return false;
            },
            child: getWidget(context)));
  }

  void onBackPressed(/*{forceBack = false}*/) {
    NavigationService.close();
    //if (forceBack) Navigator.pop(context);
    // return Future(() => false);
  }

  Widget getWidget(BuildContext context);

  void update() {
    if (mounted) setState(() {});
  }
}
