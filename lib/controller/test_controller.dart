
// // ignore_for_file: avoid_print, unused_import

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../core/class/statusrequest.dart';
// import '../core/functions/handlingdatacontroller.dart';
// import '../data/remote/test_data.dart';

// class TestController extends GetxController {
//   TestData testData = TestData(Get.find());

//   List data = [];

//   late StatusRequest statusRequest;

//   getData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await testData.getData();
//     print("=============================== Controller $response ") ;
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       data.addAll(response['data']);
//     }
//     update();
//   }

//   @override
//   void onInit() {
//     getData();
//     super.onInit();
//   }
// }