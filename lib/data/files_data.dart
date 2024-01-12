// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/linkapi.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/class/crud.dart';
import 'remote/auth/login_data.dart';

class FilesData {
  Crud crud;
  FilesData(this.crud);
  CreateFile(
    String Foldername,String Filename,dynamic group_id,String token
  ) async {
    var response = await crud.postData(AppLink.CreateFile, {
      "Folder_name": Foldername,
      "fileName": Filename,
      "group_id": group_id.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  GetMyFilesBGroupId(
    int group_id,String token
  ) async {
    var response = await crud.postData(AppLink.ViewMyFilesByGroupId,{
      "id": group_id.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  DeleteFile(
    int FileId,String token
  ) async {
    var response = await crud.postData(AppLink.DeleteFile, {
      "id": FileId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
   CheckIn(
    int FileId,String token
  ) async {
    var response = await crud.postData(AppLink.CheckIn, {
      "file id": FileId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  CheckOut(
    int FileId,String token
  ) async {
    var response = await crud.postData(AppLink.CheckOut, {
      "file id": FileId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
   EditFile(
    String FileName,String new_content,String token
  ) async {
    var response = await crud.postData(AppLink.EditFile, {
      "fileName": FileName,
      "old_path":new_content,
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  ReplaceFile(
    int FileId,String token
  ) async {
    var response = await crud.postData(AppLink.ReplaceFile, {
      "file_id": FileId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}

