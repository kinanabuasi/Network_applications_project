// // ignore_for_group: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
// ignore_for_group: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, avoid_print, unused_element
// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, void_checks, camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, unused_element, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:p1/controller/files_view_controller.dart';
import 'package:p1/screen/auth/customlogo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constant/imageasset.dart';
import '../../controller/Folders_view_controller.dart';
import '../../core/constants/routes.dart';
import '../../screen/auth/signup.dart';
import '../controller/auth/login_controller.dart';
import '../controller/auth/logout_controller.dart';
import '../controller/groups_view_controller.dart';
import '../core/class/crud.dart';
import '../core/functions/localization/validinput.dart';
import '../screen/auth/customtextform.dart';

class DialogWithTextField extends StatelessWidget {
  Crud crud = Get.put(Crud());
  String Enter;
  IconData icon;
  TextEditingController EC;
  int FunNum;
  int? GgroupId;
  DialogWithTextField(
      {required this.Enter,
      required this.icon,
      required this.EC,
      required this.FunNum,this.GgroupId});
  final GroupsListControllerIMP groupcontroller =
      Get.put(GroupsListControllerIMP());
      final FileControllerIMP fileController =
      Get.put(FileControllerIMP());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Enter),
      content: Form(
        // key: groupcontroller.formStategroupkey,
        child: CustomTextForm(
          hintText: Enter,
          iconData: icon,
          isNumber: true,
          mycontroller: EC,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            switch (FunNum) {
              case 1:
                {
                  Get.back(result: groupcontroller.CreatingGroup());
                }
                break;
              case 2:
                {
                  Get.back(result: groupcontroller.UpdateGroup(context,GgroupId!));
                }
                break;
              case 3:
                {
                  Get.back(result: fileController.CreateFile("folder1", GgroupId));
                }
                break;
              case 4:
                {
                  Get.back(result: fileController.EditFile(context, EC.text));
                }
            }
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
