// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    middleText: "do you want to exit ",
    actions: [
      ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("Confirm")),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Cancel"),
      ),
    ],
  );
  return Future.value(true);
}
