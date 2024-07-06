import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_homy/component/reciepe_tile.dart';
import 'package:the_homy/component/service_tile.dart';
import 'package:the_homy/pages/all_recipe_page.dart';
import 'package:the_homy/pages/navigation_menu.dart';
import 'package:the_homy/pages/notification_page.dart';
import 'package:the_homy/pages/qr_page.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/provider/services_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class AvatarSelectionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Your Avatar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .setAvatar(index + 1);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          'lib/assets/avatar${index + 1}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = const Color(0xFFFFF7F7);
  final ref = FirebaseDatabase.instance.ref('IOS/Service/');
  final controller = Get.find<NavigationControler>();

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, ServiceProvider>(
      builder: (context, authProviders, provider, child) {
        final serviceList = provider.serviceList;
        final state = provider.state;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QrPage(
                                      UID: fireAuth.FirebaseAuth.instance
                                          .currentUser!.uid)));
                        },
                        child: const Icon(Icons.qr_code)),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
                        },
                        child: SvgPicture.asset('lib/assets/notification.svg')),
                  ],
                ),
              ),
            ],
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AvatarSelectionDialog(),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: authProviders.avatar == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset('lib/assets/user_pic.png'))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                  'lib/assets/avatar${authProviders.avatar}.png'),
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'welcome',
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        authProviders.myUser?.userName ?? 'Guest',
                        style: const TextStyle(
                            fontSize: 13, fontFamily: 'Poppins'),
                      ),
                      Text(
                        authProviders.myUser?.address['city'] ?? 'Location',
                        style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
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
                      future: provider.bannerList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 238, 227, 227),
                            highlightColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 175,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
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
                                child:
                                    Image.network(imageUrl, fit: BoxFit.cover),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 16),

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
                    Container(
                      child: state == ServiceState.loading
                          ? Shimmer.fromColors(
                              baseColor:
                                  const Color.fromARGB(255, 238, 227, 227),
                              highlightColor:
                                  const Color.fromARGB(255, 255, 255, 255),
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
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.0,
                              crossAxisSpacing: 16.0,
                              children:
                                  List.generate(serviceList.length, (index) {
                                final data = serviceList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ServiceTile(service: data),
                                );
                              }),
                            ),
                    ),

                    Container(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recipes',
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 18),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.navigateToPage(1, AllRecipePage());
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => AllRecipePage()),
                              //);
                            },
                            child: const Text('more'),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 1000,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 15),
                              child: RecipeTile());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
