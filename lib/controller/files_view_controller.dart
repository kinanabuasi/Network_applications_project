// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/screen/auth/customlogo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/files_data.dart';
import '../screen/files_view.dart';
import '../widget/TopSnackBar.dart';
import 'auth/login_controller.dart';

// abstract class FileController extends GetxController {
//   CreatingFile();
//   ViewMyFiles();
//   DeleteFile();
// }
class FileControllerIMP extends GetxController {
  // final files = <CustomFolderForm>[].obs;
  late TextEditingController file_name = TextEditingController();
  late TextEditingController new_content = TextEditingController();
  List<dynamic> FilesList = [].obs;
  List<dynamic> FileName = [].obs;
  List<dynamic> FileId = [].obs;
  List<dynamic> GroupId = [].obs;
  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
  FilesData filesData = FilesData(Get.find());
  dynamic File_Name;
  dynamic fileId;
  dynamic group_id;

  ViewMyFiles(int group_id) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.GetMyFilesBGroupId(group_id, token);
    print("========== Controller $response ");
    print("group_id: $group_id");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // print(response);

      FilesList.assignAll(response['data']);
      FileName.clear();
      FileId.clear();
      GroupId.clear();

      for (var item in FilesList) {
        File file = File(
          id: item["id"],
          name: item["name"],
          groupid: item["group_id"],
        );
        FileName.add(file.name);
        FileId.add(file.id);
        GroupId.add(file.groupid);
      }
      print("ID: $FileId, Name: $FileName, GroupId: $GroupId");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "No Files for view");
      // const CustomSnackBar.error(message: "Your Group is not created");
      // return groups;
    }
    // }
    Get.to(files_view(GroupId: group_id));
    update();
  }

  CreateFile(String Foldername, dynamic group_id) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response =
        await filesData.CreateFile(Foldername, file_name.text, group_id, token);
    print("========== Controller $response ");
    // print(
    //     "token: $Foldername,file_name: ${file_name.text},group_id:$group_id ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(
          title: "Warning", middleText: "Cannot create a new file");
    }
    ViewMyFiles(group_id);
    update();
  }

  CheckIn(context, int file_id) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.CheckIn(file_id, token);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      Get.defaultDialog(
          title: "success", middleText: "File is successfully Checked In");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(
          title: "Warning", middleText: "File is Reserved");
    }
    update();
  }

  Checkout(context, int file_id) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.CheckOut(file_id, token);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
      Get.defaultDialog(
          title: "success", middleText: "File is successfully Checked Out");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(
          title: "Warning", middleText: "you are not allowed to edit this file right now");
    }
    update();
  }

  DeleteFile(int FileId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.DeleteFile(FileId, token);
    // print("========== Controller $response ");
    // print("token: $token");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print(response);
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(
          title: "Warning", middleText: "Cannot create a new file");
    }
    // ViewMyFiles();
    update();
  }

  EditFile(context, String FileName) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.EditFile(FileName, new_content.text, token);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // print(response);
      Get.defaultDialog(
          title: "Success",
          middleText: "${response['message']} ${new_content.text} ");
      // TopSnackBar_success(context, "File is successfully Edited");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "Cannot Edit file");
    }
    update();
  }

  ReplaceFile(context, int FileId) async {
    String token = loginControllerImp.data[0];
    var statusRequest = StatusRequest.loading;
    var response = await filesData.ReplaceFile(FileId, token);
    statusRequest = handlingData(response);
    print(FileId);
    if (StatusRequest.success == statusRequest) {
      // print(response);
      Get.defaultDialog(
          title: "Success",
          middleText: "${response['message']} ${response['0']}");
      // TopSnackBar_success(context, "File is successfully Edited");
    } else {
      statusRequest = StatusRequest.failure;
      print("!!!!!!!!!! Controller $response ");
      Get.defaultDialog(title: "Warning", middleText: "Cannot Replace file");
    }
    update();
  }

  @override
  void onInit() {
    ViewMyFiles(group_id);
    file_name = TextEditingController();
    new_content = TextEditingController();
    super.onInit();
  }
}

class File {
  final String name;
  final int id;
  final int groupid;
  File({required this.id, required this.name, required this.groupid});
}
