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
import '../widget/DialogWithTextField.dart';
import '../widget/showMenu.dart';
import 'auth/CustomButtomAuth.dart';
import 'auth/customtextform.dart';
import '../../core/class/crud.dart';
import 'auth/folders_view.dart';
import 'files_view.dart';

class groups_view extends StatelessWidget {
  groups_view({super.key});
  // dynamic GroupId;
  Crud crud = Get.put(Crud());
  final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
  final FolderController folderController = Get.put(FolderController());
  FileControllerIMP fileController = Get.put(FileControllerIMP());
  LogoutControllerImp logoutControllerImp = Get.put(LogoutControllerImp());
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Form(
          key: controller.formStategroupkey,
          child: ListView(
            children: [
              
              ListTile(
                title: Text('New Group'),
                onTap: () {
                  // Show the dialog and wait for a result.
                  final result = Get.dialog(DialogWithTextField(
                      Enter: "Enter group's name",
                      icon: Icons.group,
                      EC: controller.group_name,
                      FunNum: 1));
                },
              ),
              ListTile(
                title: Text('View My Groups'),
                onTap: () {
                  Get.find<GroupsListControllerIMP>().ViewMyGroups();
                },
              ),
            
              ListTile(
                title: Text('Log out'),
                onTap: () {
                  logoutControllerImp.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Form(
        // key: controller.formStategroupkey,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          // padding: EdgeInsets.all(25),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.GroupsNames.length,

              // padding: EdgeInsets.all(3),
              itemBuilder: (context, index) {
                dynamic group = controller.GroupsNames[index];
                dynamic GroupId = controller.GroupsIds[index];
                controller.GroupId = controller.GroupsIds[index];
                fileController.group_id = GroupId;
                // GroupId = groupId;
                return Container(
                  color: Color.fromARGB(255, 234, 217, 68),
                  margin: EdgeInsets.all(5),
                  child: GestureDetector(
                    onSecondaryTapDown: (details) =>
                        _showMenu(context, details, GroupId),
                    // },
                    onDoubleTap: () => fileController.ViewMyFiles(GroupId),
                    // print(GroupId),
                    // Get.to(files_view(GroupId: GroupId)),
                    // },
                    child: SizedBox(
                      height: screenHeight / 6,
                      width: screenWidth / 3,
                      child: Text(
                        group,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                );
                // Card(
                //   child: Column(
                //     children: [
                //       Text(group[index]),
                // Obx(
                //   () => GridView.builder(
                //     itemCount: folderController.folders.length,
                //     gridDelegate:
                //         SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //     ),
                //     itemBuilder: (context, folderIndex) {
                //       final folder =
                //           folderController.folders[folderIndex];
                //       return Card(
                //         child: Column(
                //           children: [
                //             // Text(folder.name),
                //             Obx(
                //               () => GridView.builder(
                //                 itemCount: fileController.files.length,
                //                 gridDelegate:
                //                     SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 2,
                //                 ),
                //                 itemBuilder: (context, fileIndex) {
                //                   final file =
                //                       fileController.files[fileIndex];
                //                   return Card(
                //                       // child: Text(file.name),
                //                       );
                //                 },
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // ],
                // ),
                // );
              },
            ),

            // ),
          ),
        ),
      ),
    );
  }
}

_showMenu(BuildContext context, TapDownDetails details, dynamic groupId) {
  final menuItems = ['Item 1', 'Item 2', 'Item 3'];
  final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
  LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
  dynamic UsersNames = loginControllerImp.UsersNames;
  final menu = PopupMenuButton(
    itemBuilder: (BuildContext context) {
      return menuItems.map((String item) {
        return PopupMenuItem(
          value: item,
          child: ListTile(
            title: Text(item),
            onTap: () => Get.back(result: item),
          ),
        );
      }).toList();
    },
  );

  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      details.globalPosition.dx,
      details.globalPosition.dy,
      details.globalPosition.dx + 1,
      details.globalPosition.dy + 1,
    ),
    items: [
      PopupMenuItem(
        child: ListTile(
          title: Text('Delete the group'),
          onTap: () {
            controller.DeleteGroup(groupId);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Add user to the group'),
          onTap: () {
            loginControllerImp.HandleUsersData();
          },
          trailing: IconButton(
            mouseCursor: MouseCursor.defer,
            visualDensity: null,
            onPressed: () =>
                _showDynamicListDialog(context, UsersNames, groupId, 1),
            icon: Icon(Icons.arrow_right),
          ),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Remove user from the Group'),
          onTap: () {
            loginControllerImp.HandleUsersData();
          },
          trailing: IconButton(
            mouseCursor: MouseCursor.defer,
            visualDensity: null,
            onPressed: () =>
                _showDynamicListDialog(context, UsersNames, groupId, 2),
            icon: Icon(Icons.arrow_right),
          ),
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Leave the group'),
          onTap: () {
            controller.LeaveGroup(context, groupId);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Rename'),
          onTap: () {
            Get.dialog(
              DialogWithTextField(
                Enter: "Enter group's new name",
                icon: Icons.group,
                EC: controller.NewName,
                FunNum: 2,
                GgroupId: groupId,
              ),
            );
          },
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      print('Selected item: $value');
    }
  });
}

void _showDynamicListDialog(BuildContext context, List<String> dynamicList,
    dynamic GroupId, dynamic functionId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      print(dynamicList);
      return DynamicListDialog(
        dynamicList: dynamicList,
        GroupId: GroupId,
        FunctionId: functionId,
      );
    },
  ).then((selectedItem) {
    if (selectedItem != null) {
      print('Selected item: $selectedItem');
    }
  });
}
