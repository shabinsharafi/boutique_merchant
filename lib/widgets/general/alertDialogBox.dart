import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  AlertDialogBox(
      {this.onPositive,
      this.onNegative,
      this.title,
      this.positiveButton = "Yes",
      this.negativeButton = "No",
      this.message = "Are you sure"});

  String? title;
  String message;
  String positiveButton;
  String negativeButton;

  VoidCallback? onNegative;
  VoidCallback? onPositive;

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    Widget cancelButton = Container(
      height: 38,
      child: MaterialButton(
        onPressed: onNegative != null
            ? onNegative
            : () {
                Navigator.pop(context);
              },
        child: Text(negativeButton,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
      ),
    );
    Widget continueButton = Container(
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: MaterialButton(
        onPressed: onPositive != null
            ? onPositive
            : () {
                Navigator.pop(context);
              },
        child: Text(positiveButton,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
      ),
    );
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10,),
                title != null
                    ? Text(
                        title!,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    : SizedBox(),
                title != null
                    ? SizedBox(
                        height: 10,
                      )
                    : SizedBox(),
                Text(
                  message,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: cancelButton),
                    Container(
                      width: 1,
                      height: 20,
                      color: Colors.grey,
                    ),
                    Expanded(child: continueButton),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
