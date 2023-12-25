// ignore_for_file: unused_import, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart ';
import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "firstname") {
    if (!GetUtils.isUsername(val)) {
      return "not valid First-name";
    }
  }
  if (type == "lastname") {
    if (!GetUtils.isUsername(val)) {
      return "not valid Last-name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty ";
  }
  if (val.length > max) {
    return "can't be larger than $max ";
  }
  if (val.length < min) {
    return "can't be less than $min ";
  }
}
// isMatch(validInput( val1.validInput  min,  max,  type),validInput( val2, min,  max,  type)){

// }
