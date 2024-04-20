import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:the_homy/component/combo_tile.dart';
import 'package:the_homy/pages/service_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Color(0xFFFFF7F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        actions: const [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.qr_code),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.notification_add_rounded)
                ],
              ))
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('lib/assets/user_pic.png'),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                children: [
                  Text(
                    'welcome',
                    style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Abhishek Sharma',
                    style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Banner
                GestureDetector(
                  onTap: () {},
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 8,
                    child: Image.asset('lib/assets/banner.png'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Our Services',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                  ),
                ),

                // Services container

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesPage2())),
                      child: Container(
                        child: Stack(
                          children: [
                            Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 148,
                                padding: EdgeInsets.all(12),
                                width: 136,
                                child: Transform.rotate(
                                  angle: -1.5708,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Kitchen King',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Cooking',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              color: Colors.red.shade400))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                height: 180,
                                width: 155,
                                alignment: Alignment.bottomRight,
                                child:
                                    Image.asset('lib/assets/cheff_doodle.png'))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ServicesPage2())),
                      child: Container(
                        child: Stack(
                          children: [
                            Material(
                              elevation: 8,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                height: 148,
                                padding: EdgeInsets.all(12),
                                width: 136,
                                child: Transform.rotate(
                                  angle: -1.5708,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dust Guard',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            color: Colors.red.shade400,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Comming soon',
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              color: Colors.red.shade400))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 145,
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                  'lib/assets/dust_guard_doodle.png'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 8, bottom: 0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Combos',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                  ),
                ),

                // Combos list
                const SingleChildScrollView(
                  padding: EdgeInsets.all(14),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyComboTile(
                        comboName: 'Kitchen King',
                        comboDescription:
                            "Cook + Once a week toilet cleaner + full house cleaning",
                        price: 9999,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      MyComboTile(
                        comboName: 'Dust Guard',
                        comboDescription:
                            "Cook + Once a week toilet cleaner + full house cleaning",
                        price: 9999,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
