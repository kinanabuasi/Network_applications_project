// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  TextAlign? textAlign;
  TextDecoration? underLine;
  String? fontfamily;
  MyText(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      this.textAlign,
      this.fontfamily,
      this.underLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: underLine,
        fontFamily: fontfamily,
      ),
    );
  }
}
