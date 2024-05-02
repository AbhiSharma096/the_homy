import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/pages/service_page2.dart';
import 'package:the_homy/provider/services_provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final ref = FirebaseDatabase.instance.ref('Data/Service/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: FirebaseAnimatedList(
              scrollDirection: Axis.horizontal,
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServicesPage2(available: 'jsdbjd'))),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.child('Name').value.toString(),
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 18,
                                        color: Colors.red.shade400,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(snapshot.child('Fun').value.toString(),
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
                            child: Image.asset('lib/assets/cheff_doodle.png'))
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
    // Access the data from the provider
  }
}
