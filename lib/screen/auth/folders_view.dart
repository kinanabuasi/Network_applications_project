// // ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import
// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, sized_box_for_whitespace, avoid_print, unused_element

import 'package:flutter/material.dart%20';
import 'package:get/get.dart';
import 'package:p1/screen/auth/customlogo.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../constant/imageasset.dart';
import '../../controller/Folders_view_controller.dart';
import '../../core/constants/routes.dart';
import '../../screen/auth/signup.dart';


class Folders_view extends StatelessWidget {
  Folders_view({super.key});
  final FolderController controller = Get.put(FolderController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 233, 37),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back))
        ],
        // actions: [
        //   IconButton(onPressed: (){}
        //   , icon: Icon(Icons.menu))
        // ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            CustomLogoForm(
                image: ImageAsset.logo, address: "Kinan", sign: "User 1"),
            ListTile(
              title: Text('Add Folders'),
              onTap: () {
                // Handle add file action here
              },
            ),
            ListTile(
              title: Text('Select Folders'),
              onTap: () {
                // Handle select files action here
              },
            ),
            ListTile(
              title: Text('Reports about Reserved and Free Folders'),
              onTap: () {
                // Handle select files action here
              },
            ),
          ],
        ),
      ),
      body: Container(
        // margin: EdgeInsets.all(0.1),
        // padding: EdgeInsets.all(25),
        child: Obx(
          () => GridView.builder(
            itemCount: controller.folders.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // Adjust the number of columns as needed
              mainAxisSpacing: screenWidth / 10,
              crossAxisSpacing: screenHeight / 10,
              // childAspectRatio: 2,
            ),
            // padding: EdgeInsets.all(3),
            itemBuilder: (context, index) {
              final file = controller.folders[index];
              return
              //  SizedBox(
                // height: 10,
                // width: 10,
                // child:
                 GestureDetector(
                  child: file,
                  onTap: () {
                    // ShowContextMenu();
                  },
                // ),
                // ),
                // ),
              );
            },
          ),
        ),
      ),
    );
  }
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
            Navigator.pop(context); // Close the context menu
          },
        ),
        ListTile(
          title: Text('Context Menu Item 2'),
          onTap: () {
            // Handle context menu item 2 action
            Navigator.pop(context); // Close the context menu
          },
        ),
      ],
    );
  }
}

void showContextMenu(BuildContext context) {
  final List<Widget> menuItems = [
    ListTile(
      title: Text('Context Menu Item 1'),
      onTap: () {
        // Handle context menu item 1 action
        Navigator.pop(context); // Close the context menu
      },
    ),
    ListTile(
      title: Text('Context Menu Item 2'),
      onTap: () {
        // Handle context menu item 2 action
        Navigator.pop(context); // Close the context menu
      },
    ),
  ];
}
