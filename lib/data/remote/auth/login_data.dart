// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/linkapi.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/class/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(
    String email,
    String password,
  ) async {
    var response = await crud
        .postData(AppLink.login, {"email": email, "password": password},{});


    return response.fold((l) => l, (r) => r);
  }
  HandleUsersData(
    String token
  ) async {
    var response = await crud.postData(AppLink.usersdata, {
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}
