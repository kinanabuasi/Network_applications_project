// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, sort_child_properties_last, unrelated_type_equality_checks, non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool isNumber;
  bool? obscuretext=false;
  final void Function()? onTapIcon;
  IconButton? icon2;
  TextInputType? keyboard;
  CustomTextForm({
    Key? key,
    required this.hintText,
    required this.iconData,
    this.mycontroller,
    this.valid,
    required this.isNumber,
    this.onTapIcon,
    this.icon2,
    this.keyboard,
     this.obscuretext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscuretext == null || obscuretext == false ? false : true,
      autofocus: true,
      keyboardType: keyboard,
      controller: mycontroller,
      // obscureText: Obscuretext!,
      style: TextStyle(color: Colors.black),
      validator: valid,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        prefixIcon: Icon(iconData),
        suffixIcon: icon2,
        prefixIconColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle(
      {Key? key, required this.title, required this.sign, required this.body})
      : super(key: key);
  final String title;
  final String sign;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(192, 240, 236, 236),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          sign,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
