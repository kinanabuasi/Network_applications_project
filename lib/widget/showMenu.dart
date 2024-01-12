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
import '../core/functions/localization/validinput.dart';

class DynamicListDialog extends StatelessWidget {
  final List<String> dynamicList;
  dynamic GroupId;
  dynamic FunctionId;

  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
  final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
  DynamicListDialog({required this.dynamicList, required this.GroupId,required this.FunctionId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dynamic List'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: dynamicList.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic UsersId = loginControllerImp.UsersIds[index];

            return ListTile(
              title: Text(dynamicList[index].toString()),
              onTap: () {
                if (FunctionId ==1){
                  controller.AddUserToGroup(
                  context,
                  GroupId,
                  UsersId,
                );

                }
                else{
                  controller.RemoveUserfromGroup(
                  context,
                  GroupId,
                  UsersId,
                );

                }
              },
            );
          },
        ),
      ),
    );
  }
}
