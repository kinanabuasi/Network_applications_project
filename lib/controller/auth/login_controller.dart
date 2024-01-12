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
  HandleUsersData();
  // showpass();
}

class LoginControllerImp extends LoginController {
  // GlobalKey<FormState> formStateloginkey = GlobalKey();
  final formStateloginkey = GlobalKey<FormState>();
  late TextEditingController email =
      TextEditingController();
  late TextEditingController password =
      TextEditingController();
  // bool isshowpass = true;
  LoginData loginData = LoginData(Get.find());

  List data = [];
  List UsersData = [];
  List<String> UsersNames = [];
  List UsersIds = [].obs;

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
        Get.defaultDialog(
          title: "success", middleText: "Successfully Log In");
        Get.toNamed(AppRoute.groups_view);
      } else {
        statusRequest = StatusRequest.failure;
        // print("=========!!!!!!!!!! Controller $response ");
       Get.defaultDialog(
          title: "Warning", middleText:
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
    // HandleUsersData();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  return_token() {
    return data;
  }

  @override
  HandleUsersData() async {
    String token = data[0];
    var statusRequest = StatusRequest.loading;
    var response = await loginData.HandleUsersData(token);
    print("========== Controller $response ");
    // print("token: $token");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // print(response);

      UsersData.assignAll(response['users']);
      UsersNames.clear();
      UsersIds.clear();
      for (var item in UsersData) {
        User user = User(
          id: item["id"],
          name: item["name"],
        );
        UsersNames.add(user.name);
        UsersIds.add(user.id);
      }
      print("ID: $UsersIds, Name: $UsersNames");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "No Users Data to view");
    }
  }
}

class User {
  dynamic id;
  dynamic name;
  User({required this.id, required this.name});
}
