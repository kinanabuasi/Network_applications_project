// ignore_for_file: prefer_const_constructors, must_be_immutable, override_on_non_overriding_member, body_might_complete_normally_nullable, prefer_is_not_empty, avoid_print, unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../controller/auth/signup_controller.dart';
import '../../core/class/crud.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/localization/validinput.dart';
import 'CustomButtomAuth.dart';
import 'customlogo.dart';
import 'customtextform.dart';
import 'customtextsign.dart';
import '../../constant/imageasset.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Crud crud = Get.put(Crud());
    SignUpControllerImp controller = Get.put(SignUpControllerImp());

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImageAsset.background,
                )),
          ),
          child: Form(
            key: controller.formStatesignupkey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogoForm(
                    image: ImageAsset.logo,
                    address: "Welcome !",
                    sign: "Create your account"),
                Column(
                  children: [
                    SizedBox(
                      width: screenWidth / 2.7,
                      child: CustomTextForm(
                        keyboard: TextInputType.name,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "firstname");
                        },
                        mycontroller: controller.username,
                        hintText: "Enter your Full name",
                        iconData: Icons.person,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 15,
                    ),

                    SizedBox(
                      width: screenWidth / 2.7,
                      child: CustomTextForm(
                        keyboard: TextInputType.emailAddress,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 6, 100, "email");
                        },
                        mycontroller: controller.email,
                        hintText: "Enter your Email",
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 15,
                    ),

                    SizedBox(
                      width: screenWidth / 2.7,
                      child: CustomTextForm(
                        obscuretext: !controller.passwordVisible,
                        keyboard: TextInputType.visiblePassword,
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        onTapIcon: () {
                          // controller.togglePasswordVisibility();
                        },
                        mycontroller: controller.password,
                        hintText: "Enter your Password",
                        iconData: Icons.lock_outline_rounded,
                        icon2: IconButton(
                          icon: Icon(controller.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 15,
                    ),

                    SizedBox(
                      width: screenWidth / 2.7,
                      child: CustomTextForm(
                        obscuretext: !controller.passwordVisible,

                        isNumber: false,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return "can't be Empty";
                          }
                          if (val != controller.password.text) {
                            return "the two passwords don't match";
                            // return null;
                          }
                          return null;
                          // return null;
                        },
                        hintText: "Confirm your Password",
                        iconData: Icons.lock_reset_rounded,
                        icon2: IconButton(
                          icon: Icon(controller.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),

                      ),
                    ),
                    // ),
                    SizedBox(
                      height: screenHeight / 15,
                    ),
                    SizedBox(
                      width: screenWidth / 2.7,
                      height: screenHeight / 12,
                      child: CustomButtonAuth(
                        text: "Sign up",
                        color: Color.fromARGB(255, 226, 77, 226),
                        onPressed: () {
                          controller.signUp(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 15,
                    ),
                    CustomTextSign(
                        textone: "You have an account? ",
                        texttwo: "Sign In",
                        onTap: () {
                          controller.goToLogIn();
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
      // ),
      // ),
    );
  }
}
