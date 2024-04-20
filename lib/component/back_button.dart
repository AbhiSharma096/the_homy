import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyBackButton extends StatelessWidget {
  final Function onTap;
  const MyBackButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onTap,
      child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.arrow_back_ios_new)))),
    );
  }
}
