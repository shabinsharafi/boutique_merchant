import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';
import 'package:boutique_merchant/widgets/GradientMask.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';

class RetryCommon extends StatefulWidget {
  VoidCallback onTap;
  String errorMsg;
  RetryCommon({required this.onTap, required this.errorMsg});
  @override
  _RetryCommonState createState() => _RetryCommonState();
}

class _RetryCommonState extends State<RetryCommon> {
  @override
  Widget build(BuildContext context) {
    String error = widget.errorMsg == "Seems you have problem connecting to the network."?"An error occured while loading. Please try again":"Something went wrong";
    print(widget.errorMsg);
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 50.0, bottom: 50.0, left: 20, right: 20),
        decoration: BoxDecoration(
         color: Color(backgroundBlack),
        borderRadius: BorderRadius.all(Radius.circular(borderRadiusNormal)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GradientMask(
                child: Icon(
                  Icons.warning_outlined,
                  size: 50,
                )),
            SizedBox(height: 20),
            Text(error, style: textStyleAlertHeading,textAlign: TextAlign.center,),
            SizedBox(height: 20),
            PrimaryButton("Retry", onTap:widget.onTap)
          ],
        ),
      ),
    );
  }
}