import 'dart:ui';

import 'package:intl/intl.dart';

extension ColorExtension on Color {
  Color parseColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}

extension DoubleExtension on double {
  double toFixedDecimal({count = 2}) {
    return double.parse(toStringAsFixed(2));
  }
}
extension StringExtension on String {
  String capitalize() {
    if(isNotEmpty) {
      return this[0].toUpperCase()+substring(1).toLowerCase();
    } else {
      return this;
    }
  }
  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');
  }
  String removeUnderScore() {
    return replaceAll("_", " ").capitalize();
  }
}

extension DateExtension on DateTime {
  String toDDMMYYYY() {
    return DateFormat("dd-MM-yyyy").format(this);
  }
  String toMMMDDYYYY() {
    return DateFormat("MMM dd, yyyy").format(this);
  }
}
