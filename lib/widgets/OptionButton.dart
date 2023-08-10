import 'package:boutique_merchant/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boutique_merchant/styles/theme.dart';

// ignore: must_be_immutable
class OptionButton extends StatelessWidget {
  String option;
  List? selectedOptions;
  bool selected;
  double verticalPadding;
  double borderRadius;
  TextAlign textAlign;
  Function(String val) onSelected;

  OptionButton(this.option,
      {required this.onSelected,
      this.selectedOptions,
      this.borderRadius = 15,
      this.selected = false,
      this.verticalPadding = 8,
      this.textAlign = TextAlign.left,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("object");
        onSelected(option);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Styles.color.primaryColor,width: 2),
          color: selected ? Styles.color.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(option,
              style: textStyleOptionsButton.copyWith(
                  color: !selected ? Styles.color.primaryColor : Colors.white),
              textAlign: textAlign),
        ),
      ),
    );
  }
}
