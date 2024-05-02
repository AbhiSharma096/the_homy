import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_homy/component/combo_tile.dart';
import 'package:the_homy/pages/service_page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Color(0xFFFFF7F7);
  final ref = FirebaseDatabase.instance.ref('IOS/Service/');
  Future<List<String>> getBannerImages() async {
    // Replace 'banners' with your Firebase Storage folder path
    Reference ref = FirebaseStorage.instance.ref('banners');
    ListResult result = await ref.listAll();
    List<String> imageUrls = [];
    for (Reference imageRef in result.items) {
      String downloadUrl = await imageRef.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    return imageUrls;
  }

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
                FutureBuilder<List<String>>(
                  future: getBannerImages(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); 
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
                              child:
                                  Image.network(imageUrl, fit: BoxFit.cover));
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
                      left: 12, right: 12, top: 8, bottom: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Our Services',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                  ),
                ),

                // Services container

                SizedBox(
                  height: 185,
                  child: FirebaseAnimatedList(
                      defaultChild: Shimmer.fromColors(
                        baseColor: Colors.red.shade300,
                        highlightColor: Colors.red.shade100,
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
                      ),
                      duration: const Duration(seconds: 5),
                      scrollDirection: Axis.horizontal,
                      query: ref,
                      itemBuilder: (context, snapshot, animation, index) {
                        return GestureDetector(
                          onTap: () {
                            var available =
                                snapshot.child('Fun').value.toString();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ServicesPage2(available: available),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  height: 148,
                                  padding: const EdgeInsets.all(12),
                                  width: 136,
                                  child: Transform.rotate(
                                    angle: -1.5708,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot
                                              .child('Name')
                                              .value
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              color: Colors.red.shade400,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            snapshot
                                                .child('Fun')
                                                .value
                                                .toString(),
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
                                  child: Image.asset(
                                      'lib/assets/${snapshot.child('Img').value.toString()}.png'))
                            ],
                          ),
                        );
                      }),
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
