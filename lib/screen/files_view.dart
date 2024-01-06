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

class files_view extends StatelessWidget {
  files_view({super.key});
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
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.white,
      //   child: ListView(
      //     children: [
      //       CustomLogoForm(
      //           image: ImageAsset.logo, address: "Kinan", sign: "User 1"),
      //       ListTile(
      //         title: Text('Create a Group'),
      //         onTap: () {
      //           // Show the dialog and wait for a result.
      //           final result = Get.dialog(DialogWithTextField());
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Select Groups'),
      //         onTap: () {
      //           // Handle select groups action here
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Reports about Reserved and Free Groups'),
      //         onTap: () {
      //           // Handle select groups action here
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Log out'),
      //         onTap: () {
      //           // Handle select groups action here
      //           logoutControllerImp.logout(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
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
                mainAxisSpacing: screenWidth / 15,
                crossAxisSpacing: screenHeight / 15,
                // childAspectRatio: 2,
              ),
              // padding: EdgeInsets.all(3),
              itemBuilder: (context, index) {
                final group = controller.groups[index];
                return Card(
                  child: Column(
                    children: [
                      Text(group.name),
                      Obx(
                        () => GridView.builder(
                          itemCount: folderController.folders.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, folderIndex) {
                            final folder =
                                folderController.folders[folderIndex];
                            return Card(
                              child: Column(
                                children: [
                                  // Text(folder.name),
                                  Obx(
                                    () => GridView.builder(
                                      itemCount: fileController.files.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemBuilder: (context, fileIndex) {
                                        final file =
                                            fileController.files[fileIndex];
                                        return Card(
                                            // child: Text(file.name),
                                            );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
