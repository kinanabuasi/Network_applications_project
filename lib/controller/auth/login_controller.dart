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
import '../../widget/TopSnackBar.dart';
import '../groups_view_controller.dart';

abstract class LoginController extends GetxController {
  login(BuildContext context);
  goToSignUp();
  return_token();
  // goToForgetPass();
  // showpass();
}

class LoginControllerImp extends LoginController {
  // GlobalKey<FormState> formStateloginkey = GlobalKey();
  final formStateloginkey = GlobalKey<FormState>();
  var EmailInitialValue = TextEditingValue(text: "kinan@gmail.com");
  var PasswordInitialValue = TextEditingValue(text: "12345678");
  late TextEditingController email =
      TextEditingController.fromValue(EmailInitialValue);
  late TextEditingController password =
      TextEditingController.fromValue(PasswordInitialValue);
  bool isshowpass = true;
  LoginData loginData = LoginData(Get.find());
  // GroupsListControllerIMP groupsListControllerIMP =
  //     Get.put(GroupsListControllerIMP());
  List data = [];

  @override
  login(context) async {
    if (formStateloginkey.currentState!.validate()) {
      var statusRequest = StatusRequest.loading;
      var response = await loginData.postdata(email.text, password.text);
      // Map responsebody = jsonDecode(response.body);
      // var token = responsebody['token'];
      print("=============================== Controller ${response} ");
      // print("******* token: $token ********");
      // Map responsebody = loginData.responsebody;
      // print(responsebody.toString());
      statusRequest = handlingData(response);
      // Map mapValue = json.decode(response);
      // print('Token value: ${mapValue.values.toString()}');
      if (StatusRequest.success == statusRequest) {
        // if (response['statue'] == "success") {
        data.add(response['token']);
        print("******* token_data $data ");
        // }
        TopSnackBar_success(context, "Successfully Log In");
        Get.toNamed(AppRoute.groups_view);
      } else {
        statusRequest = StatusRequest.failure;
        // print("=========!!!!!!!!!! Controller $response ");
        TopSnackBar_error(context,
            "Unfortunately, your Sign In is Faild, Email or password is Wrong");
      }
      // }
      update();
      // groupsListControllerIMP.ViewMyGroups();
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

  @override
  return_token() {
    return data;
  }
}
