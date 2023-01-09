import 'package:flutter/material.dart';

class CustomLoader {
  static OverlayEntry? overlayEntry;

  static show(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry ??= OverlayEntry(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black38,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.06,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    });

    // inserting overlay entry
    try {
      overlayState!.insert(overlayEntry!);
    } catch (e) {
      print("Multiple loader called");
    }
  }

  static void dismiss() {
    overlayEntry!.remove();
  }
}
