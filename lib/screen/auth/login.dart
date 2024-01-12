// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import, unused_local_variable, unused_label, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constant/imageasset.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/class/crud.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/localization/validinput.dart';
import '../../widget/MyText.dart';
import 'CustomButtomAuth.dart';
import 'customlogo.dart';
import 'customtextform.dart';
import 'customtextsign.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Crud crud = Get.put(Crud());
    LoginControllerImp controller = Get.put(LoginControllerImp());
    // ForgetPassControllerImp controller1=Get.put(ForgetPassControllerImp());
      final double screenWidth = MediaQuery.of(context).size.width;
      final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          color: Color.fromARGB(255, 240, 208, 197),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        

          child: Form(
            key: controller.formStateloginkey,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogoForm(
                    image: ImageAsset.folder,
                    address: "Welcome Back!",
                    sign: "Log in to your accont"),
                Column(children: [
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
                      // InitialValue: "kinan@gmail.com",
                      // mycontroller: controller.email,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 15,
                  ),
                  //  Obx(() =>
                  SizedBox(
                    width: screenWidth / 2.7,
                    child: CustomTextForm(
                      // obscuretext: controllerImp.isshowpassword,
                      onTapIcon: () {
                        // controllerImp.showPassword();
                        // icon1: Icon(Icons.remove_red_eye_rounded,
                        // color:Colors.red,  );
                      },
                      // obscuretext: true,
                    //   icon2: IconButton(
                    //   icon: Icon(controller.passwordVisible.value
                    //       ? Icons.visibility_off
                    //       : Icons.visibility),
                    //   onPressed: () {
                    //     controller.togglePasswordVisibility();
                    //   },
                    // ),
                      isNumber: false,
                      valid: (val) {
                      return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      hintText: "Password",
                      iconData: Icons.lock_outline_rounded,
                      // mycontroller: controller.password,
                    ),
                  ),
                  // ),
                  // SizedBox(
                  //   height: screenHeight / 17,
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // controllerImp.goToForgetPassword();
                  //   },
                  //   child: MyText(
                  //     text: "Forget your password?",
                  //     textAlign: TextAlign.center,
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  SizedBox(
                    height: screenHeight / 15,
                  ),
                  SizedBox(
                    width: screenWidth / 2.7,
                    height: screenHeight / 12,
                    child: CustomButtonAuth(
                      text: "Sign in",
                      onPressed: () {
                        controller.login(context);
                        // controller.login_v(context);
                        // Get.to(HomeView());
                        // Get.to(AppRoute.Folders_view);
                        // showTopSnackBar(
                        //       context as OverlayState,
                        //       CustomSnackBar.success(
                        //         backgroundColor: Colors.blueAccent,
                        //         message: " your Sign In is successful. Have a nice Experiment",
                        //       ),
                        //     );
                      },
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 17,
                  ),
                  CustomTextSign(
                      textone: "You don't have an account?  ",
                      texttwo: "Sign Up",
                      onTap: () {
                      controller.goToSignUp();
                      }),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
