import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:boutique_merchant/constants/theme.dart';
import 'package:boutique_merchant/widgets/GradientMask.dart';

// ignore: must_be_immutable
class ImageOptionButton extends StatefulWidget {
  String option;
  double verticalPadding;
  double borderRadius;
  bool selected;
  Function(String val) onSelected;

  ImageOptionButton(this.option,
      {required this.onSelected,
        this.borderRadius = 15,
        this.selected = false,
        this.verticalPadding = 8,
        Key? key})
      : super(key: key);

  @override
  State<ImageOptionButton> createState() => _ImageOptionButtonState();
}

class _ImageOptionButtonState extends State<ImageOptionButton> {
  late Decoration _selectedDecoration;

  late Decoration _unselectedDecoration;

  @override
  void initState() {

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
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: widget.selected ? _selectedDecoration : _unselectedDecoration,
            child: Container(
              margin: const EdgeInsets.all(2),
            //padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(backgroundGrey),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
 //          child:
//           Container(
//             height: 40,
//             width: 40,
//             child: GradientMask(
//                       child: SvgPicture.asset("assets/images/onboarding/check_icon.svg",
//                       )
//             ),
 //          ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
    /* child:
                FadeInImage.memoryNetwork(
                  image:"${widget.option}",
                  placeholder: Container(),
                  // placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                ),*/
              ),
            ),
          ),
          Positioned(
                  bottom: 20,
                  right: 20,
              child: widget.selected?GradientMask(
                  child: SvgPicture.asset("assets/images/onboarding/check_icon.svg"))
                  : Align(alignment:Alignment.bottomRight,child: Container())),
        ],
      ),
    );
  }
}
//              Positioned.fill(
////                  bottom: 10,
////                  left: 10,
//                  child: _selected?GradientMask(
//                      child: SvgPicture.asset("assets/images/onboarding/check_icon.svg"))
//                      : Align(alignment:Alignment.bottomRight,child: Container())),