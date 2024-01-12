// ignore_for_file: unused_import, must_call_super, non_constant_identifier_names, override_on_non_overriding_member, avoid_print, prefer_const_constructors, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/linkapi.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../core/class/crud.dart';
import 'remote/auth/login_data.dart';

class GroupData {
  Crud crud;
  GroupData(this.crud);
  CreateGroup(
    String groupname,String token
  ) async {
    var response = await crud.postData(AppLink.CreateGroup, {
      "name": groupname,
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  ViewMyGroups(
    String token
  ) async {
    var response = await crud.getData(AppLink.ViewMyGroups, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  ViewAllGroups(
    String token
  ) async {
    var response = await crud.getData(AppLink.ViewAllGroups, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  DeleteGroup(
    int GgroupId,String token
  ) async {
    var response = await crud.postData(AppLink.DeleteGroup, {
      "group_id": GgroupId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  UpdateGroup(
    int GgroupId,String NewName,String token
  ) async {
    var response = await crud.postData(AppLink.UpdateGroup, {
      "name":NewName,
      "group_id": GgroupId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
    LeaveGroup(
    int GgroupId,String token
  ) async {
    var response = await crud.postData(AppLink.LeaveGroup, {
      "group_id": GgroupId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  AddUserToGroup(
    int GgroupId,int UserId,String token
  ) async {
    var response = await crud.postData(AppLink.AddUserToGroup, {
      "group_id": GgroupId.toString(),
      "new_user":UserId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
  RemoveUserfromGroup(
    int GgroupId,UserId,String token
  ) async {
    var response = await crud.postData(AppLink.RemoveUserfromGroup, {
      "group_id": GgroupId.toString(),
      "user2":UserId.toString(),
    }, {
      "token":token,
    });
    return response.fold((l) => l, (r) => r);
  }
}

