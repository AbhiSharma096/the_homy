import 'package:flutter/material.dart';

class MyComboTile extends StatelessWidget {
  final String comboName ;
  final String comboDescription;
  final int price;
  const MyComboTile({super.key, required this.comboDescription,required this.comboName,required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.red[50]),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red[400],
              ),
              height: 120,
              width: 120,
            ),
            Text(comboName),
            Text(comboDescription),
            Text('cleaner + + full house cleaning'),
            Text(
              'only @ ${price}*',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
