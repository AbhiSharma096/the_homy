import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_homy/component/combo_tile.dart';
import 'package:the_homy/component/service_tile.dart';
import 'package:the_homy/pages/service_page2.dart';
import 'package:the_homy/provider/services_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Color(0xFFFFF7F7);
  final ref = FirebaseDatabase.instance.ref('IOS/Service/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions:  [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.qr_code),
                    const SizedBox(
                      width: 12,
                    ),
                    SvgPicture.asset('lib/assets/notification.svg')
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
        body: Consumer<ServiceProvider>(builder: (context, provider, child) {
          final serviceList = provider.serviceList;
          final state = provider.state;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Banner
                    FutureBuilder<List<String>>(
                      future: provider.bannerList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 238, 227, 227),
                            highlightColor: Color.fromARGB(255, 255, 255, 255),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  height: 175,
                                  width: 280,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                )),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return CarouselSlider(
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: true,
                            ),
                            items: snapshot.data?.map<Widget>((imageUrl) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(imageUrl,
                                      fit: BoxFit.cover));
                            }).toList(),
                          );
                        }
                      },
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    Container(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 6,
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Our Services',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // Services container

                    Container(
                      child: state == ServiceState.loading
                          ? Shimmer.fromColors(
                              baseColor: Color.fromARGB(255, 238, 227, 227),
                              highlightColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ShimmerBox(),
                                    SizedBox(width: 10),
                                    ShimmerBox(),
                                    SizedBox(width: 10),
                                    ShimmerBox(),
                                  ],
                                ),
                              ),
                            )
                          : GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.0,
                              crossAxisSpacing: 16.0,
                              children:
                                  List.generate(serviceList.length, (index) {
                                final data = serviceList[index];
                                return Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: ServiceTile(
                                    service: data,
                                  ),
                                );
                              }),
                            ),

                      // ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: serviceList.length,
                      //     itemBuilder: (context, index) {
                      //       final data = serviceList[index];
                      //       return Padding(
                      //         padding: EdgeInsets.only(left: 10),
                      //         child: ServiceTile(
                      //           service: data,
                      //         ),
                      //       );
                      //     },
                      //   ),
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
          );
        }));
  }
}

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

