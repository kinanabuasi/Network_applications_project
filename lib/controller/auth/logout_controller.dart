// ignore_for_file: unused_import, must_call_super, avoid_print, prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/login_data.dart';
import '../../data/remote/auth/logout_data.dart';
import '../../widget/TopSnackBar.dart';
import 'login_controller.dart';

abstract class LogoutController extends GetxController {
  logout(BuildContext context);
}

class LogoutControllerImp extends LogoutController {
  final formStatelogoutkey = GlobalKey<FormState>();
  LogoutData logoutData = LogoutData(Get.find());
  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
  List data = [];

  @override
  logout(context) async {
    // if (formStatelogoutkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      var response = await logoutData.getdata(loginControllerImp.data[0]);
      print("=============================== Controller ${response} ");
      print(loginControllerImp.data[0]);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.defaultDialog(
          title: "success", middleText: "Succeccfully Logged out");
        Get.offNamed(AppRoute.login);
      } else {
        statusRequest = StatusRequest.failure;
        // print("=========!!!!!!!!!! Controller $response ");
       Get.defaultDialog(
          title: "Warning", middleText: "Unfortunately, your Sign out is Faild");
      }
      update();
    // }
  }
}
