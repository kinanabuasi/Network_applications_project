// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onPressed;

  const CustomButtonAuth({Key? key, required this.text, this.onPressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        
      ),
     
      elevation: 3,
      minWidth: 500,
      height: 55,
      onPressed: onPressed,
      child: Text(
        text,style: TextStyle(fontSize: 25,
       fontWeight: FontWeight.w700,
       color: Color.fromARGB(255, 0, 141, 134)),
      ),
      color:Color.fromARGB(255, 232, 137, 249),
      textColor: Colors.white,
    );
  }
}
