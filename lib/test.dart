// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class HomeController extends GetxController {
//   // Define the data structures to store the groups, folders, and files
//   var groups = [].obs;
//   var folders = [].obs;
//   var files = [].obs;

//   // Define the controllers for each GridView
//   var groupsController = ScrollController();
//   var foldersController = ScrollController();
//   var filesController = ScrollController();

//   // Logic to get the data from the MySQL database and Laravel project
//   // Future<void> getData() async {
//   //   // Connect to the MySQL database
//   //   var connection = await MySqlConnection.connect(settings);
//   //   // Query the database for the groups
//   //   var groupsResult = await connection.query('SELECT * FROM groups');
//   //   groups.value = groupsResult.rows;
//   //   // For each group, query the database for the folders
//   //   for (var group in groups) {
//   //     var foldersResult = await connection
//   //         .query('SELECT * FROM folders WHERE group_id = ?', [group['id']]);
//   //     folders.value.addAll(foldersResult.rows);
//   //     // For each folder, query the database for the files
//   //     for (var folder in folders) {
//   //       var filesResult = await connection
//   //           .query('SELECT * FROM files WHERE folder_id = ?', [folder['id']]);
//   //       files.value.addAll(filesResult.rows);
//   //     }
//   //   }
//   // Close the MySQL connection
//   // await connection.close();
//   // Update the UI
//   // update();
//   // }
//   // Logic to handle the scrolling of the GridViews
//   // void onScroll(int index) {
//   //   // Get the current scroll position of the GridView
//   //   var scrollPosition = groupsController.offset;
//   //   // If the scroll position is greater than the height of the GridView,
//   //   // then disable scrolling for the previous GridView
//   //   if (scrollPosition > groupsController.position.maxScrollExtent) {
//   //     foldersController.position.maxScrollExtent = 0;
//   //   } else {
//   //     // Otherwise, enable scrolling for the previous GridView
//   //     foldersController.position.maxScrollExtent = double.infinity;
//   //   }
//   //   // Update the UI
//   //   update();
//   // }

//   // Logic to handle the tapping of an item in the GridView
//   void onTap(int index) {
//     // Get the selected item
//     var item = groups[index];

//     // Navigate to the next screen, passing the selected item as an argument
//     Get.toNamed('/next_screen', arguments: item);
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get the HomeController instance
//      final HomeController controller = Get.put(HomeController());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter GetX MySQL Laravel'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               controller: controller.groupsController,
//               itemCount: controller.groups.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () => controller.onTap(index),
//                   child: Container(
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(controller.groups[index]['name']),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               controller: controller.foldersController,
//               itemCount: controller.folders.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: Colors.green,
//                   child: Center(
//                     child: Text(controller.folders[index]['name']),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               controller: controller.filesController,
//               itemCount: controller.files.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(
//                   color: Colors.red,
//                   child: Center(
//                     child: Text(controller.files[index]['name']),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Example data models
// class Group {
//   final String name;
//   Group(this.name);
// }

// class Folder {
//   final String name;
//   Folder(this.name);
// }

// class File {
//   final String name;
//   File(this.name);
// }

// // Example controllers
// class GroupController extends GetxController {
//   final groups = <Group>[].obs;

//   @override
//   void onInit() {
//     // Fetch groups from the database table
//     // Populate the `groups` list with fetched data
//     super.onInit();
//   }
// }

// class FolderController extends GetxController {
//   final folders = <Folder>[].obs;

//   @override
//   void onInit() {
//     // Fetch folders from the database table
//     // Populate the `folders` list with fetched data
//     super.onInit();
//   }
// }

// class FileController extends GetxController {
//   final files = <File>[].obs;

//   @override
//   void onInit() {
//     // Fetch files from the database table
//     // Populate the `files` list with fetched data
//     super.onInit();
//   }
// }

// class MyGridView extends StatelessWidget {
//   final GroupController groupController = Get.put(GroupController());
//   final FolderController folderController = Get.put(FolderController());
//   final FileController fileController = Get.put(FileController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GridView Example'),
//       ),
//       body: Obx(
//         () => GridView.builder(
//           itemCount: groupController.groups.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (context, groupIndex) {
//             final group = groupController.groups[groupIndex];
//             return Card(
//               child: Column(
//                 children: [
//                   Text(group.name),
//                   Obx(
//                     () => GridView.builder(
//                       itemCount: folderController.folders.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                       ),
//                       itemBuilder: (context, folderIndex) {
//                         final folder = folderController.folders[folderIndex];
//                         return Card(
//                           child: Column(
//                             children: [
//                               Text(folder.name),
//                               Obx(
//                                 () => GridView.builder(
//                                   itemCount: fileController.files.length,
//                                   gridDelegate:
//                                       SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                   ),
//                                   itemBuilder: (context, fileIndex) {
//                                     final file =
//                                         fileController.files[fileIndex];
//                                     return Card(
//                                       child: Text(file.name),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GridViewController extends GetxController {
//   var items = <String>[].obs;

//   void addItem() {
//     items.add("");
//   }
// }

// class GridViewBuilderPage extends StatelessWidget {
//   final GridViewController controller = Get.put(GridViewController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GridView Builder with Add Button'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                 ),
//                 itemCount: controller.items.length,
//                 itemBuilder: (context, index) {
//                   return controller.items[index].isEmpty
//                       ? Center(
//                           child: IconButton(
//                             icon: Icon(Icons.add),
//                             onPressed: () {
//                               controller.addItem();
//                             },
//                           ),
//                         )
//                       : Container(
//                           color: Colors.blue,
//                         );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
// ```

// In this code, the `GridViewController` class is used to manage the list of items. The `items` variable is an observable list, which means that any changes to the list will be automatically reflected in the UI.

// The `addItem()` method is used to add a new item to the list. When the user taps on the "+" button, the `addItem()` method is called, which adds an empty string to the list.

// The `GridViewBuilderPage` class is the main widget that displays the grid view. The `Obx()` widget is used to wrap the `GridView.builder` widget, which ensures that the UI is updated whenever the `items` list is changed.

// The `GridView.builder` widget is used to create the grid view. The `gridDelegate` parameter is used to specify the layout of the grid. In this case, we are using a `SliverGridDelegateWithFixedCrossAxisCount` with a cross axis count of 2, which means that there will be 2 columns in the grid.

// The `itemBuilder` parameter is used to specify the widget that will be displayed for each item in the grid. In this case, we are using a conditional statement to check if the item is empty. If the item is empty, we display a "+" button. Otherwise, we display a blue container.

// When the user taps on the "+" button, the `addItem()` method is called, which adds an empty string to the `items` list. This causes the `GridView.builder` widget to rebuild, and the new "+" button is displayed

// class GroupsListControllerIMP extends GetxController {
//   final groups = [].obs;
//   late TextEditingController group_name = TextEditingController();
//   LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());

//   @override
//   ViewMyGroups() async {
   
//     String token = loginControllerImp.data[0];
//     var statusRequest = StatusRequest.loading;
//     var response = await createGroupData.getdata(token);
  
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       print(response.values);
 
//       List<dynamic> responseList = response.values();
//       groups.addAll(responseList);
//       print(groups);
//     } else {
//       statusRequest = StatusRequest.failure;
//       print("!!!!!!!!!! Controller $response ");
//       Get.defaultDialog(title: "Warning", middleText: "Groups is not viewed");
//       // const CustomSnackBar.error(message: "Your Group is not created");
//     }
//     // }
//     update();
//   }
// }
// _showUsersMenu(BuildContext context, TapDownDetails details) {
//   LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
//   final UserMenuItems = loginControllerImp.UsersNames;
//   final UsersMenu = PopupMenuButton(
//     child:ListView.builder(
//               itemCount: loginControllerImp.UsersData.length,
//           itemBuilder: ((context, index) {
//             dynamic usersNames = loginControllerImp.UsersNames[index];
//             return PopupMenuItem(
//               value: usersNames,
//               child: ListTile(
//                 title: Text(loginControllerImp.UsersNames[index].toString()),
//                 onTap: () {},
//     ),);  }),
//                   ),
//     itemBuilder: (BuildContext context) {
//       return UserMenuItems.map(( UserMenuItems) {
//         // item = loginControllerImp.UsersNames;
//         // UserMenuItems = loginControllerImp.UsersNames[];
//         return PopupMenuItem(
//           value: UserMenuItems,
//           child: ListTile(
//             title: Text(UserMenuItems),
//             onTap: () => Get.back(result: UserMenuItems),
//           ),
//         );
//       }).toList();
//     },
//   );
//   showMenu(
//     context: context,
//     position: RelativeRect.fromLTRB(
//       details.globalPosition.dx,
//       details.globalPosition.dy,
//       details.globalPosition.dx + 1,
//       details.globalPosition.dy + 1,
//     ),
//     items: [
//       PopupMenuItem(
//               value: usersNames,
//               child: ListTile(
//                 title: Text(loginControllerImp.UsersNames[index].toString()),
//                 onTap: () {},
//     ),);
//     ],
//   ).then((value) {
//     if (value != null) {
//       print('Selected item: $value');
//     }
//   });
// }
// _showUsersMenu(BuildContext context, TapDownDetails details) {
//   final menuItems = ['Item 1', 'Item 2', 'Item 3'];
//   final GroupsListControllerIMP controller = Get.put(GroupsListControllerIMP());
//   LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
//   PopupMenuButton(itemBuilder: ((context) =>
//   // Get.dialog(
//   // return showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return
//         ListView.builder(
//               itemCount: loginControllerImp.UsersData.length,
//           itemBuilder: ((context, index) {
//             dynamic usersNames = loginControllerImp.UsersNames[index];
//             return PopupMenuItem(
//               value: usersNames,
//               child: ListTile(
//                 title: Text(loginControllerImp.UsersNames[index].toString()),
//                 onTap: () {},
//               ),
//             );
//           }),
//             ),
//         );
// },
// );
//  PopupMenuButton(
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
// showMenu(
//   context: context,
//   position: RelativeRect.fromLTRB(
//     details.globalPosition.dx,
//     details.globalPosition.dy,
//     details.globalPosition.dx + 1,
//     details.globalPosition.dy + 1,
//   ),
//   items: [
//     PopupMenuItem(
//       value: loginControllerImp
//           .UsersNames[index],
//       child: ListTile(
//         title: Text(loginControllerImp
//             .UsersNames[loginControllerImp.UsersIds.length - 1]
//             .toString()),
//         onTap: () {},
//       ),
//     ),
//   ],
// ).then((value) {
//   if (value != null) {
//     print('Selected item: $value');
//   }
// });
// }
//  _showUsersMenu () {
//   LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
//     return AlertDialog(
//       content:ListView.builder(
//         itemBuilder:
//         ((context, index) {
//             dynamic usersNames = loginControllerImp.UsersNames[index];
//             return PopupMenuItem(
//               value: usersNames,
//               child: ListTile(
//                 title: Text(loginControllerImp.UsersNames[index].toString()),
//                 onTap: () {},
//               ),
//             );
//           }),),
//     );}
// showContextMenu(BuildContext context) {
//   final List<Widget> menuItems = [
//     ListTile(
//       title: Text('Context Menu Item 1'),
//       onTap: () {
//         // Handle context menu item 1 action
//       },
//     ),
//     ListTile(
//       title: Text('Context Menu Item 2'),
//       onTap: () {
//         // Handle context menu item 2 action
//       },
//     ),
//   ];
// }

