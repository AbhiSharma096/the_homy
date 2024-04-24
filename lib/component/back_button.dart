import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyBackButton extends StatelessWidget {
  final Function? onTap;
  const MyBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> Navigator.pop(context),
      child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Container(
            height: 2,
            width: 2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(Icons.arrow_back_ios_new)))),
    );
  }
}
