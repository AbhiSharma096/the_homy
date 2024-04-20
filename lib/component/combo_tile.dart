import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyComboTile extends StatelessWidget {
  final String comboName;
  final String comboDescription;
  final int price;
  const MyComboTile(
      {super.key,
      required this.comboDescription,
      required this.comboName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 300,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Image.asset(
                  'lib/assets/banner.png',
                  height: 156,
                  width: 191,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'lib/assets/kitchen_king.png',
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    comboName,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.red.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  comboDescription,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 10),
                )),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'only @${price}',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poly',
                    color: Colors.red.shade400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
