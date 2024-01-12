// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, void_checks, camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, unused_element

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
import '../controller/auth/logout_controller.dart';
import '../controller/groups_view_controller.dart';
import '../core/functions/localization/validinput.dart';
import '../widget/DialogWithTextField.dart';
import 'auth/CustomButtomAuth.dart';
import 'auth/customtextform.dart';
import '../../core/class/crud.dart';
import 'auth/folders_view.dart';
import 'groups_view.dart';

class files_view extends StatelessWidget {
  dynamic GroupId;
  files_view({super.key, required this.GroupId});
  Crud crud = Get.put(Crud());
  final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
  // final FolderController folderController = Get.put(FolderController());
  final FileControllerIMP fileController = Get.put(FileControllerIMP());
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
        child: ListView(
          children: [
            ListTile(
              title: Text('New File'),
              onTap: () {
                final result = Get.dialog(DialogWithTextField(
                  Enter: "New File's name",
                  icon: Icons.folder_copy_rounded,
                  EC: fileController.file_name,
                  FunNum: 3,
                  GgroupId: GroupId,
                ));
                // if(result == true) {
                //   return null;
                // }
              },
            ),
            ListTile(
              title: Text('Update Data'),
              onTap: () {
                fileController.ViewMyFiles(GroupId);
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
      body: Form(
        key: controller.formStategroupkey,
        child: Container(
          color: Color.fromARGB(255, 244, 219, 210),
          padding: EdgeInsets.all(10),
          // padding: EdgeInsets.all(25),
          child: Obx(
            () => ListView.builder(
              itemCount: fileController.FileName.length,
              itemBuilder: (context, fileIndex) {
                final filename = fileController.FileName[fileIndex];
                final fileId = fileController.FileId[fileIndex];
                fileController.File_Name = filename;
                fileController.fileId = fileController.FileId[fileIndex];
                return Container(
                  color: Color.fromARGB(255, 255, 245, 216),
                  margin: EdgeInsets.all(10),
                  child: GestureDetector(
                    onSecondaryTapDown: (details) =>
                        _showMenu(context, details, fileId),
                    // },
                    // onDoubleTap: () => fileController.ViewMyFiles(GroupId),
                    // },
                    child: SizedBox(
                      height: screenHeight / 6,
                      width: screenWidth / 3,
                      child: ListTile(
                        leading: Container(height: 50,width: 50,
                          decoration: BoxDecoration(
              shape: BoxShape.circle,
             
            ),
                          child: Image.asset(ImageAsset.logo)),
                
                        title: Text(
                          
                          filename,
                        ),
                        // OnPressed: () => _showMenu(context),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // ],
        ),
      ),
      // },
    );
  }
}

class NewFileDialog extends StatelessWidget {
  Crud crud = Get.put(Crud());

  // final files_view filesview = Get.put(files_view(GroupId: null,));
  final FileControllerIMP fileController = Get.put(FileControllerIMP());
  final FolderController folderController = Get.put(FolderController());

  final GroupsListControllerIMP groupsListController =
      Get.put(GroupsListControllerIMP());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter file name"),
      content: Form(
        // key: groupcontroller.formStategroupkey,
        child: CustomTextForm(
          hintText: "Write file name",
          iconData: Icons.folder,
          isNumber: true,
          mycontroller: fileController.file_name,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Get.back(
              result: fileController.CreateFile(
                  "folder1", groupsListController.GroupId),
            );
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

_showMenu(BuildContext context, TapDownDetails details, dynamic FileId) {
  final menuItems = ['Item 1', 'Item 2', 'Item 3'];
  final FileControllerIMP controller = Get.put(FileControllerIMP());

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
      // PopupMenuItem(
      //   child: ListTile(
      //     title: Text(''),
      //     onTap: () {
      //       controller.DeleteGroup(groupId);
      //     },
      //   ),
      // ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Check In'),
          onTap: () {
            controller.CheckIn(context, FileId);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Check Out'),
          onTap: () {
            controller.Checkout(context, FileId);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Edit'),
          onTap: () {
            final result = Get.dialog(
              EditFileDialog(),
            );
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Replace'),
          onTap: () {
            // final result = Get.dialog(
            controller.ReplaceFile(context, controller.fileId);

            // );
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('Delete'),
          onTap: () {
            // Handle Option 2
            controller.DeleteFile(FileId);
          },
        ),
      ),
      // Add more PopupMenuItems as needed
    ],
  ).then((value) {
    if (value != null) {
      print('Selected item: $value');
    }
  });
}

class EditFileDialog extends StatelessWidget {
  Crud crud = Get.put(Crud());

  // final files_view filesview = Get.put(files_view(GroupId: null,));
  final FileControllerIMP fileController = Get.put(FileControllerIMP());
  final FolderController folderController = Get.put(FolderController());

  final GroupsListControllerIMP groupsListController =
      Get.put(GroupsListControllerIMP());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Editing file content"),
      content: Form(
        // key: groupcontroller.formStategroupkey,
        child: CustomTextForm(
          hintText: "Write New content",
          iconData: Icons.folder,
          isNumber: true,
          mycontroller: fileController.new_content,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Get.back(
              result:
                  fileController.EditFile(context, fileController.File_Name),
            );
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
