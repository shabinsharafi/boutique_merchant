import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';
import 'package:boutique_merchant/widgets/general/primary_circular_indicator.dart';

class CircularOverlayLoader{
  BuildContext context;
  CircularOverlayLoader({required this.context}){
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height,
            color:Color(backgroundGrey).withOpacity(.5),
            //Color.fromRGBO(255, 255, 255,.75),
            child: Center(child: ClipOval(
              child: Image.asset(
                "assets/images/splashes/loader.gif",
                width: 100,
                //height: 500,
              ),
            )),
          );
        });
  }
}