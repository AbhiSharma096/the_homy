// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:the_homy/pages/cart_page.dart';

class RecentTile extends StatefulWidget {
  final VoidCallback? OnTap;
  const RecentTile({super.key, this.OnTap});

  @override
  State<RecentTile> createState() => _RecentTileState();
}

 

class _RecentTileState extends State<RecentTile> {
  void openCart(){
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(),
      ));
}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFF1F1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * 0.18,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/assets/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Homy',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.red,
                        fontFamily: 'Poppins'),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          children: [
                            Text(
                              'Services',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Visits Left',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              '   1',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Poppins'),
                            )
                          ],
                        )
                      ]),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          'lib/assets/kitchen_king.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Kitchen King',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.red.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        children: [
                          Text(
                            'Start date',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          Text(
                            '20 March 2024',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 10),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'End date',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 12),
                          ),
                          Text(
                            '20 March 2024',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'Poppins',
                                fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: openCart,
                      child: Container(
                        height: 24,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.black),
                            color: Colors.red.shade400),
                        child: Center(
                          child: Text(
                            'Book Again',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
