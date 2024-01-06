// ignore_for_file: file_names

import 'package:get/state_manager.dart';
import '../constant/imageasset.dart';
import '../screen/auth/customlogo.dart';

class FolderController extends GetxController {
  final folders = <CustomFolderForm>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate loading files from a database
    // fetchFiles();
  }

  void ViewMyFolders() {
    
  }

//   void fetchFiles() {
//     // Replace this with your database logic to fetch files
//     // Here, we're adding static file names for demonstration purposes
//     folders.value = [
//       CustomFolderForm(
//           image: ImageAsset.folder,
//           address: "Folder 1",
//           sign: "Reserved",
//           ),
//       CustomFolderForm(
//           image: ImageAsset.folder, address: "Folder 2", sign: "Free",),
//       CustomFolderForm(
//           image: ImageAsset.folder,
//           address: "Folder 3",
//           sign: "Reserved",
//           ),
//       CustomFolderForm(
//           image: ImageAsset.folder,
//           address: "Folder 4",
//           sign: "Reserved",
//           ),
//       CustomFolderForm(
//           image: ImageAsset.folder, address: "Folder 5", sign: "Free", ),
//       CustomFolderForm(
//           image: ImageAsset.folder, address: "Folder 6", sign: "Free", ),
//       CustomFolderForm(
//           image: ImageAsset.folder,
//           address: "Folder 7",
//           sign: "Reserved",
//           ),
//       CustomFolderForm(
//           image: ImageAsset.folder,
//           address: "Folder 8",
//           sign: "Reserved",
//           ),
//     ];
//   }
// }
}
