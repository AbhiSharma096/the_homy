import 'package:flutter/material.dart';
import 'package:the_homy/model/services.dart';

class CartPage extends StatefulWidget {
  final MyService service;
  const CartPage({super.key, required this.service});

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
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      widget.service.name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 3,
                  width: 160,
                  color: Colors.red,
                )
              ]),
            
              
            
            ],
          ),
        ),
      ),
    );
  }
}
