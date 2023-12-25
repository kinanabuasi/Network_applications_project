// ignore_for_file: unused_import, must_call_super, avoid_print, prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  login(BuildContext context);
  goToSignUp();
  // goToForgetPass();
  // showpass();
}

class LoginControllerImp extends LoginController {
  // GlobalKey<FormState> formStateloginkey = GlobalKey();
  final formStateloginkey = GlobalKey<FormState>();
  late TextEditingController email =
      TextEditingController(text: "kinan@gmail.com");
  late TextEditingController password = TextEditingController(text: "12345678");
  bool isshowpass = true;
  LoginData loginData = LoginData(Get.find());
  List data = [];

  @override
  login(context) async {
    if (formStateloginkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller ${response.body} ");
      statusRequest = handlingData(response);
      Map mapValue = json.decode(response.body);
      print('Token value: ${mapValue.values.toString()}');
      if (StatusRequest.success == statusRequest) {
        // if (response['statue'] == "success") {
        //   data.addAll(response['data']);
        // print("=====******* === Controller $response ");
        TopSnackBar_success(context, "Successfully Log In");
        Get.offNamed(AppRoute.groups_view);
      } else {
        statusRequest = StatusRequest.failure;
        // print("=========!!!!!!!!!! Controller $response ");
        TopSnackBar_error(context,
            "Unfortunately, your Sign In is Faild, Email or password is Wrong");
      }
      // }
      update();
    } else {}
    // print("=============================== Data $data ");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // @override
  // goToForgetPass() {
  // Get.offNamed(AppRoute.forgetpass);
  // }
  // @override
  // showpass() {
  //   isshowpass = isshowpass==true? false:true;
  //   update();
  // }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
}

TopSnackBar_success(BuildContext context, String message) {
  // OverlayState? overlayState = Overlay.of(context);
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.success(
      message: message,
      backgroundColor: Colors.blue,
    ),
  );
}

TopSnackBar_error(BuildContext context, String message) {
  // OverlayState? overlayState = Overlay.of(context);
  showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.success(
      message: message,
      backgroundColor: Colors.red,
    ),
  );
}
