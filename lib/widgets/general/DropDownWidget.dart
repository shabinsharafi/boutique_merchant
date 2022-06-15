import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';

class DropDownWidget extends StatefulWidget {
  List<dynamic> items;
  dynamic defaultValue;
  String? hintText;
  dynamic selectedValue;
  Function(dynamic) onChanged;
  bool expand;

  DropDownWidget(
      {required this.items,
      required this.onChanged,
      this.defaultValue,
      this.expand = false,
      this.hintText,
      this.selectedValue,
      Key? key})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  void initState() {
    if (widget.defaultValue != null) {
      value = widget.defaultValue!;
    }
    if (widget.hintText != null) {
      hintText = widget.hintText;
    }

  }

  dynamic value;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 20,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      //margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(backgroundBlack),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Color(0x19000000),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          dropdownColor: Color(backgroundBlack),
          menuMaxHeight: MediaQuery.of(context).size.height / 2.5,
          borderRadius: BorderRadius.circular(12),
          icon: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Icon(Icons.expand_more, color: Color(normalWhite)),
          ),
          value:widget.selectedValue??value,
          hint: widget.hintText != null
              ? Text(widget.hintText!, style: textStyleOptionsButton)
              : null,
          //context.read<DependentScreenViewModel>().childrenOptions[0],
          isExpanded: widget.expand,
          items: widget.items
              .map((item) => DropdownMenuItem<dynamic>(
                  value: item,
                  child: Builder(builder: (context) {
                    /*if (item is MasterOption)
                      return Text(
                        "${item.label}",
                        style: textStyleOptionsButton,
                      );*/
                    return Text(
                      "$item",
                      style: textStyleOptionsButton,
                    );
                  })))
              .toList(),
          onChanged: (selectedItem) {
            //print(selectedItem);
            widget.onChanged(selectedItem);
            setState(() {
              value = selectedItem;
            });
          },
//                hint: Container(
//                  child: Text('hint'),
//                ),
        ),
      ),
    );
  }
}
