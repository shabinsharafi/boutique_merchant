import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class Nothing extends StatelessWidget {
  Nothing(this.message, this.title, {this.onClick, Key? key}) : super(key: key);

  String message;
  String title;
  VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: message + "\n\n",
            style: Styles.textStyle.normalTS
                .copyWith(color: Styles.color.textColor),
            children: [
              TextSpan(
                text: title,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (onClick != null) onClick!();
                  },
                style: Styles.textStyle.subHeadingTS
                    .copyWith(color: Styles.color.primaryColor,),
              )
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
