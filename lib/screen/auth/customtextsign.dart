// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, duplicate_ignore

import 'package:flutter/material.dart';

class CustomTextSign extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
   const CustomTextSign(
      {Key? key,
      required this.textone,
      required this.texttwo,
      required this.onTap,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: prefer_const_constructors
        Text(
          textone,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        InkWell(
          onTap: onTap,
          // => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       // builder: (context) =>  const SignUp(),
          //     )),
          child: Text(
            texttwo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 76, 186, 236)
            , fontSize: 18),
          ),
        ),
      ],
    );
  }
}
