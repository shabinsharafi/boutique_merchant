import 'package:flutter/material.dart';
import 'package:boutique_merchant/constants/theme.dart';

class OptionButtonYesNo extends StatefulWidget {

  final double borderRadius;
  final double spacing;
  final double verticalPadding;
  final int? selected;
  final Function(int) onSelected;
  OptionButtonYesNo({required this.onSelected, this.borderRadius=15, this.spacing=10, this.verticalPadding=8, this.selected,Key? key}):super(key:key);
  @override
  _OptionButtonYesNoState createState() => _OptionButtonYesNoState();
}

class _OptionButtonYesNoState extends State<OptionButtonYesNo> {
  List _options = ["Yes","No"];
  late Decoration _selectedDecoration;

  late Decoration _unselectedDecoration;
  var _selectedValue = -1;
  @override
  void initState(){
    if(widget.selected!=null){
      setState(() {
        _selectedValue = widget.selected!;
      });
    }
    _selectedDecoration = BoxDecoration(
      gradient: primaryGradient,
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
    _unselectedDecoration = BoxDecoration(
      color: Color(fadedWhiteBorder),
      borderRadius: BorderRadius.circular(widget.borderRadius),
    );
    super.initState();
  }
  @override

  Widget _button({required bool selected, required double verticalPadding, required String option, required Function(int) onSelected}){
    return  GestureDetector(
      onTap: (){
        setState(() {
        if(option == "Yes"){
          _selectedValue = 1;
        }else{
          _selectedValue = 0;
        }
        onSelected(_selectedValue);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: selected ? _selectedDecoration : _unselectedDecoration,
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(backgroundGrey),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Text(option, style: textStyleOptionsButton),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Row(children: [
     _button(selected: _selectedValue==1, verticalPadding: widget.verticalPadding, option: "Yes", onSelected:widget.onSelected),
      SizedBox(width: widget.spacing,),
      _button(selected: _selectedValue==0, verticalPadding: widget.verticalPadding, option: "No",onSelected: widget.onSelected)
    ],);
  }
}
