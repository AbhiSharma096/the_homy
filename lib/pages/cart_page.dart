import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text(
            'Cart',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Caladea',
                fontSize: 30,
                color: Colors.red.shade400),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 150,
            height: 2,
            color: Colors.red,
          )
        ]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset('lib/assets/kitchen_king_name.png'),

            ],
          ),
        ),
      ),
    );
  }
}