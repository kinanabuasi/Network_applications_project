// ignore_for_file: file_names, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/core/class/statusrequest.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../constant/imageasset.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/functions/localization/validinput.dart';
import '../data/creating_group_data.dart';
import '../screen/auth/customlogo.dart';
import '../screen/auth/customtextform.dart';
import 'auth/login_controller.dart';

abstract class GroupsListController extends GetxController {
  CreatingGroup();
  ViewMyGroups();
}

class GroupsListControllerIMP extends GetxController {
  final formStategroupkey = GlobalKey<FormState>();
  var GroupNameInitialValue = TextEditingValue(text: "MyGroup");
  final groups = <dynamic>[].obs;
  final folders = <CustomFolderForm>[].obs;
  late TextEditingController group_name = TextEditingController();
  CreateGroupData createGroupData = CreateGroupData(Get.find());
  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());

  @override
  CreatingGroup() async {
    if (formStategroupkey.currentState!.validate()) {
      // formStategroupkey.currentState!.save();
      String token = loginControllerImp.data[0];
      var statusRequest = StatusRequest.loading;
      var response = await createGroupData.postdata(group_name.text, token);
      // print("========== Controller $response ");

      print("token: $token");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("******* Controller $response ");
        // const CustomSnackBar.success(
        //     message: "Your Group is successfully created");
      } else {
        statusRequest = StatusRequest.failure;
        print("!!!!!!!!!! Controller $response ");
        Get.defaultDialog(title: "Warning", middleText: "Group is not created");
        const CustomSnackBar.error(message: "Your Group is not created");
      }
    }
    update();

    // Get.offNamed(AppRoute.groups_view);
    // } else {
    // showDialog(context: context, builder: Text())
    // showTopSnackBar(
    //     context as OverlayState,
    //     CustomSnackBar.error(
    //       backgroundColor: Colors.redAccent,
    //       message: "Unfortunately, your Sign In is Faild",
    //     ),
    //   );
    // Get.defaultDialog(
    //     title: "Warning",
    //     middleText:
    //         "Something Wrong, please check your server and try again");
    // }
  }

  @override
  ViewMyGroups() async {
    // if (formStategroupkey.currentState!.validate()) {
    // formStategroupkey.currentState!.save();
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await createGroupData.getdata(token);
    // print("========== Controller $response ");
    // print("token: $token");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response.values);
      // const CustomSnackBar.success(
      //     message: "Your Groups is successfully viewed");
      List<dynamic> responseList = response['mygroups'];
      List<String> groupNames = responseList.cast<String>();
      groups.assignAll(groupNames);
      // groups.assignAll(responseList);
      print("mygroups $groups");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "Groups is not viewed");
      // const CustomSnackBar.error(message: "Your Group is not created");
      return groups;
    }
    // }
    update();
  }

  // print("=============================== Data $data ");
  // Get.offAllNamed(AppRoute.test_view);
  // void onTap(int index) {
  //   // Get the selected item
  //   var item = folders[index];
  //   // Navigate to the next screen, passing the selected item as an argument
  //   Get.toNamed('/folders_view', arguments: item);
  // }
  // void fetchFiles() {
  //   // Replace this with your database logic to fetch groups
  //   // Here, we're adding static file names for demonstration purposes
  //   groups.value = [
  // CustomFolderForm(
  //   image: ImageAsset.group,
  //   address: "Group 1",
  //   sign: "Reserved",
  // ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 2",
  //       sign: "Free",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 3",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 4",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 5",
  //       sign: "Free",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 6",
  //       sign: "Free",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 7",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.group,
  //       address: "Folder 8",
  //       sign: "Reserved",
  //     ),
  //   ];
  //   folders.value = [
  //     CustomFolderForm(
  //       image: ImageAsset.folder,
  //       address: "Group 1",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.folder,
  //       address: "Folder 2",
  //       sign: "Free",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.folder,
  //       address: "Folder 3",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.folder,
  //       address: "Folder 4",
  //       sign: "Reserved",
  //     ),
  //     CustomFolderForm(
  //       image: ImageAsset.folder,
  //       address: "Folder 5",
  //       sign: "Free",
  //     ),
  //   ];
  // }
  @override
  void onInit() {
    group_name = TextEditingController();
    ViewMyGroups();
    super.onInit();
  }

  @override
  void dispose() {
    group_name.dispose();
    super.dispose();
  }

// void confirmButtonPressed() {
//     if (formStateGroupKey.currentState!.validate()) {
//       formStateGroupKey.currentState!.save();
//       groupController.creatingGroup();
//     }
//   }
}

class Group {
  final String name;
  Group(this.name);
}
