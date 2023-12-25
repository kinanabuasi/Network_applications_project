// ignore_for_file: file_names
import 'package:get/state_manager.dart';
import 'package:p1/screen/auth/customlogo.dart';


class FileController extends GetxController {
  final files = <CustomFolderForm>[].obs;

  @override
  void onInit() {
    // Fetch files from the database table
    // Populate the `files` list with fetched data
    super.onInit();
  }
}

class File {
  final String name;
  File(this.name);
}
