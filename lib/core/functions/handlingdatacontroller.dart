// ignore_for_file: unused_import

import 'package:get/get.dart';

import '../class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
