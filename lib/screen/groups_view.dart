// // ignore_for_group: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
// ignore_for_group: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, avoid_print, unused_element
// ignore_for_file: unused_import, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, void_checks, camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, unused_element

import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:p1/controller/auth/files_view_controller.dart';
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
import 'auth/CustomButtomAuth.dart';
import 'auth/customtextform.dart';
import '../../core/class/crud.dart';
import 'auth/folders_view.dart';
import 'files_view.dart';

class groups_view extends StatelessWidget {
  groups_view({super.key});
  Crud crud = Get.put(Crud());
  final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
  final FolderController folderController = Get.put(FolderController());
  final FileController fileController = Get.put(FileController());
  LogoutControllerImp logoutControllerImp = Get.put(LogoutControllerImp());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
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
              CustomLogoForm(
                  image: ImageAsset.logo, address: "Kinan", sign: "User 1"),
              ListTile(
                title: Text('Create a Group'),
                onTap: () {
                  // Show the dialog and wait for a result.
                  final result = Get.dialog(DialogWithTextField());
                },
              ),
              ListTile(
                title: Text('Select Groups'),
                onTap: () {
                  // Handle select groups action here
                  // Get.to(files_view());
                  controller.ViewMyGroups();
                },
              ),
              ListTile(
                title: Text('Reports about Reserved and Free Groups'),
                onTap: () {
                  // Handle select groups action here
                },
              ),
              ListTile(
                title: Text('Log out'),
                onTap: () {
                  // Handle select groups action here
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
          // margin: EdgeInsets.all(0.1),
          // padding: EdgeInsets.all(25),
          child: Obx(
            () => GridView.builder(
              itemCount: controller.groups.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjust the number of columns as needed
                // mainAxisSpacing: 3,
                mainAxisSpacing: screenWidth / 12,
                crossAxisSpacing: screenHeight / 15,
                // mainAxisExtent: 0.5,
                // childAspectRatio: 2,
              ),
              // padding: EdgeInsets.all(3),
              itemBuilder: (context, index) {
                dynamic group = controller.groups[index];
                return
                CustomFolderForm(
                  image: ImageAsset.group,
                  address: group,
                  sign: "Reserved",
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
          ),
        ),
      ),
    );
  }
}

class DialogWithTextField extends StatelessWidget {
  Crud crud = Get.put(Crud());
  final GroupsListControllerIMP groupcontroller =
      Get.put(GroupsListControllerIMP());
  final FolderController folderController = Get.put(FolderController());
  final FileController fileController = Get.put(FileController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter group's name"),
      content: Form(
        // key: groupcontroller.formStategroupkey,
        child: CustomTextForm(
          hintText: "write group's name",
          iconData: Icons.group,
          isNumber: true,
          mycontroller: groupcontroller.group_name,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: groupcontroller.CreatingGroup());
            // groupcontroller.CreatingGroup();
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

void _showMenu(BuildContext context, TapDownDetails details) {
  final menuItems = ['Item 1', 'Item 2', 'Item 3'];

  // final menu = PopupMenuButton(
  //   itemBuilder: (BuildContext context) {
  //     return menuItems.map((String item) {
  //       return PopupMenuItem(
  //         value: item,
  //         child: ListTile(
  //           title: Text(item),
  //           onTap: () => Get.back(result: item),
  //         ),
  //       );
  //     }).toList();
  //   },
  // );

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
          title: Text('Reserve'),
          onTap: () {
            // Handle Option 1
            Get.back();
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Text('UnReserve'),
          onTap: () {
            // Handle Option 2
            Get.back();
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

class ShowContextMenu extends StatelessWidget {
  const ShowContextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Context Menu Item 1'),
          onTap: () {
            // Handle context menu item 1 action
          },
        ),
        ListTile(
          title: Text('Context Menu Item 2'),
          onTap: () {
            // Handle context menu item 2 action
          },
        ),
      ],
    );
  }
}

showContextMenu(BuildContext context) {
  final List<Widget> menuItems = [
    ListTile(
      title: Text('Context Menu Item 1'),
      onTap: () {
        // Handle context menu item 1 action
      },
    ),
    ListTile(
      title: Text('Context Menu Item 2'),
      onTap: () {
        // Handle context menu item 2 action
      },
    ),
  ];
}
