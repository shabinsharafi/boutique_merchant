

import 'package:boutique_merchant/utilities.dart';

class Validations {
  static String? email(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp validEmail = new RegExp(pattern as String);
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    if (validEmail.hasMatch(value)) {
      return null;
    }
    return "Enter a valid email";

//    if(!value.contains("@")){
//      return "Please enter a valid email";
//    }
//    return null;
  }

  static String? phone(String value) {
    if (value.isEmpty) {
      return "Phone number can't be empty";
    }
   if (value.length != 10) {
     return "Please enter a valid phone number";
   }
    return null;
  }

  static String? required(String? value) {
    if (value==null) {
      return "Required field";
    }
    if (value.isEmpty) {
      return "Required field";
    }
    return null;
  }

  static String? textLimit(String value, {int min = 0, int max = 512}) {
    if (value.isEmpty) {
      return "Required field";
    } else if (value.length < min) {
      return "Minimum $min characters required";
    } else if (value.length > max) {
      return "Limit exceeded. Maximum $max characters allowed";
    }
    return null;
  }

  static String? gender(int value) {
    if (value == -1) {
      return 'Gender Required';
    }
    return null;
  }
  static String? requiredInt(int value) {
    if (value == -1) {
      return "Required field";
    }
    return null;
  }

  /*static dateValidation(String fromDate, String toDate) {
    if(Utilities.convertStringToDateTime(fromDate).isBefore(Utilities.convertStringToDateTime(toDate)))
      return null;
    return "Start date is past the End date";
  }*/
}
