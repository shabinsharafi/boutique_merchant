import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';

// ignore: must_be_immutable
class OptionButton extends StatefulWidget {
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
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  late Decoration _selectedDecoration;

  late Decoration _unselectedDecoration;
  bool _selected = false;

  @override
  void initState() {
    _selected = widget.selected;

    _selectedDecoration = BoxDecoration(
      gradient: primaryGradient,
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
    _unselectedDecoration = BoxDecoration(
      color: Color(fadedWhiteBorder),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSelected(widget.option),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: _selected ? _selectedDecoration : _unselectedDecoration,
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: EdgeInsets.symmetric(
              vertical: widget.verticalPadding, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(backgroundGrey),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Text(widget.option,
              style: textStyleOptionsButton, textAlign: widget.textAlign),
        ),
      ),
    );
  }
}
