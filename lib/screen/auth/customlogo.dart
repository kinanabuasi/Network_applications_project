// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';

class CustomLogoForm extends StatelessWidget {
  final String image;
  final String address;
  final String sign;
  double x=200;
// final String assetName = 'online-shop-logo.jpg';
// final String svg = SvgPicture.asset('online-shop-logo.jpg'
// ) as String;
  TextEditingController? mycontroller;
  CustomLogoForm(
      {Key? key,
      required this.image,
      required this.address,
      required this.sign,
      this.mycontroller,x})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        Container(
          width: x,
          height: x,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                image,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          address,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          sign,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
      // ),
    );
  }
}

class CustomFolderForm extends StatelessWidget {
  final String image;
  final String address;
  final String sign;

  TextEditingController? mycontroller;
  CustomFolderForm(
      {Key? key,
      required this.image,
      required this.address,
      required this.sign,
      this.mycontroller,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
               scale:0.2,
              fit: BoxFit.fill,
              image: AssetImage(
                image,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          address,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          sign,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 9,
          ),
        ),
        // SizedBox(
        //   height: 5,
        // ),
      ],
      // ),
    );
  }
}
