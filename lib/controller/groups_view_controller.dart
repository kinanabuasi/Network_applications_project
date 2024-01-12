// ignore_for_file: file_names, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, unused_import

import 'dart:convert';
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
import '../widget/TopSnackBar.dart';
import 'auth/login_controller.dart';

abstract class GroupsListController extends GetxController {
  CreatingGroup();
  ViewMyGroups();
  DeleteGroup();
}

class GroupsListControllerIMP extends GetxController {
  final formStategroupkey = GlobalKey<FormState>();
  // var GroupNameInitialValue = TextEditingValue(text: "MyGroup");
  List<dynamic> responseList = [].obs;
  final GroupsNames = <dynamic>[].obs;
  final GroupsIds = <dynamic>[].obs;
  final folders = <CustomFolderForm>[].obs;
  List<String> selectedGroups = [];
  dynamic GroupId;
  late TextEditingController group_name = TextEditingController();
  late TextEditingController NewName = TextEditingController();
  GroupData groupData = GroupData(Get.find());
  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());

  CreatingGroup() async {
    if (formStategroupkey.currentState!.validate()) {
      // formStategroupkey.currentState!.save();
      String token = loginControllerImp.data[0];
      var statusRequest = StatusRequest.loading;
      var response = await groupData.CreateGroup(group_name.text, token);
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
    ViewMyGroups();
    update();
  }

  ViewMyGroups() async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.ViewMyGroups(token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      responseList.assignAll(response['mygroups']);
      print(responseList);
      GroupsNames.clear();
      GroupsIds.clear();
      print("My Groups:");
      for (var item in responseList) {
        Group group = Group(
          id: item["id"],
          name: item["name"].toString(),
        );
        GroupsNames.add(group.name);
        GroupsIds.add(group.id);
      }
      print("ID: $GroupsIds, Name: $GroupsNames");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "No Groups for view");
    }
    update();
  }

  ViewAllGroups() async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.ViewAllGroups(token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      responseList.assignAll(response['message']);
      print(responseList);
      GroupsNames.clear();
      GroupsIds.clear();
      print("My Groups:");
      for (var item in responseList) {
        Group group = Group(
          id: item["id"],
          name: item["name"].toString(),
        );
        GroupsNames.add(group.name);
        GroupsIds.add(group.id);
      }
      print("ID: $GroupsIds, Name: $GroupsNames");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "No Groups for view");
    }
    update();
  }

  DeleteGroup(int GgroupId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.DeleteGroup(GgroupId, token);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(GgroupId);
      CustomSnackBar.success(message: "Group is successfully deleted");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "Group is not deleted");
    }
    ViewMyGroups();
    update();
  }

  LeaveGroup(context, int GgroupId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.LeaveGroup(GgroupId, token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.defaultDialog(
          title: "success", middleText: "you successfully left this group");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "cannot left this group");
    }
    ViewMyGroups();
    update();
  }

  AddUserToGroup(context, int GroupId, int UserId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.AddUserToGroup(GroupId, UserId, token);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.defaultDialog(
          title: "success", middleText: "${response['message']}");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "${response['message']}");
    }
  }

  RemoveUserfromGroup(context, int GgroupId, int UserId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.RemoveUserfromGroup(GgroupId, UserId, token);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.defaultDialog(
          title: "success", middleText: "${response['message']}");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "${response['message']}");
    }
    ViewMyGroups();
    update();
  }

  UpdateGroup(context, int GgroupId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await groupData.UpdateGroup(GgroupId, NewName.text, token);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // print(GgroupId);
      // TopSnackBar_success(context, "Group is successfully Updated");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "Group is not Updated");
    }
    ViewMyGroups();
    update();
  }

  @override
  void onInit() {
    group_name = TextEditingController();
    NewName = TextEditingController();
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
  final dynamic id;
  final String name;

  Group({required this.id, required this.name});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
    );
  }
}
