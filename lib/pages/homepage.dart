
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:the_homy/component/combo_tile.dart';
import 'package:the_homy/onboarding.dart/onboarding_view.dart';
import 'package:the_homy/pages/service_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            children: [
              Icon(
                Icons.image,
                size: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    'welcome',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Abhishek Sharma',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 12),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 180,
                    width: 450,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'lib/assets/cheff.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Services text
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                    width: 450,
                    child: Text(
                      'Our Services',
                      textAlign: TextAlign.left,
                    )),
                const SizedBox(
                  height: 10,
                ),
                
                // Services container
                
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 12),
                  child: GestureDetector(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ServicesPage())),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 12,
                      child: Container(
                        
                        decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: HexColor('#E23744'),
                            )),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Image.asset('lib/assets/kitchen_king.png')),
                                const Column(
                                  children: [
                                    Text(
                                      'Kitchen King',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text('Cooking')
                                  ],
                                )
                              ],
                            ),
                            const Padding(
                                padding: EdgeInsets.all(12), child: Icon(Icons.menu))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 12),
                  child: Material(
                    elevation: 12,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(                      
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: HexColor('#E23744'),
                          )),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(12),
                                  child:Image.asset('lib/assets/dust_master.png')),
                              const Column(
                                children: [
                                  Text(
                                    'Dust Guard',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text('House Cleaning'),
                                  Text('Comming soon',style: TextStyle(fontSize: 10,color: Colors.grey),)
                                ],
                              )
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.all(12), child: Icon(Icons.menu))
                        ],
                      ),
                    ),
                  ),
                ),
                
                
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 450,
                  child: Text(
                    'Combos',
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 12,),

                // Combos list
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyComboTile(comboName: 'KitchenKing',comboDescription: "Cook + Once a week ",price: 9999,),
                      SizedBox(
                        width: 30,
                      ),
                      MyComboTile(comboName: 'Kitchen King',comboDescription: "Cook + Once a week ",price: 9999,),
                      SizedBox(
                        width: 30,
                      ),
                      MyComboTile(comboName: 'KitchenKing',comboDescription: "Cook + Once a week ",price: 9999,)
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
