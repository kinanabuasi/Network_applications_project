// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/test_view.dart';
import 'core/constants/routes.dart';
import 'screen/auth/folders_view.dart';
import 'screen/auth/login.dart';
import 'screen/auth/signup.dart';
import 'screen/files_view.dart';
import 'screen/groups_view.dart';
// import 'package:p1/test.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
    // name: "/signup",
    // page: () => Login(),
    // page: () => SignUp(),
    //  page: () => Folders_view(),
  // ),
  // GetPage(name: "/", page: () => Folders_view()),
  GetPage(name: "/", page: () => SignUp()),
  GetPage(name: "/login", page: () => Login()),
  GetPage(name: "/folders_view", page: () => Folders_view()),
  GetPage(name: "/groups_view", page: () => groups_view()),
  GetPage(name: "/files_view", page: () => files_view()),
];

// Map<String, Widget Function(BuildContext)> routes = {
//   "/login": (context) =>  Login() ,
//   "/signup": (context) => SignUp() ,
//   AppRoute.onBoarding: (context) => const OnBoarding() ,
//   AppRoute.forgetpass:(context) => const ForgetPass(),
//   "/resetPass":(context) => const ResetPassword(),
//   AppRoute.verfiyCode:(context) => const VerifyCode(),
// };
