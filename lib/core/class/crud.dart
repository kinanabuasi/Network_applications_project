// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../functions/checkinternet.dart';
import 'statusrequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      // if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl),
          body: data,);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return Left(StatusRequest.offlinefailure);
      // }
    } catch (_) {
      return Left(StatusRequest.serverfailure);
    }
  }
}
