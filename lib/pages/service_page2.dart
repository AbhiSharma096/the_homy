import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_homy/component/my_tab_bar.dart';
import 'package:the_homy/component/sliver_appbar.dart';
import 'package:the_homy/model/services.dart';
import 'package:the_homy/pages/cart_page.dart';

class ServicesPage2 extends StatefulWidget {
  final MyService service;

  const ServicesPage2({super.key, required this.service});

  @override
  State<ServicesPage2> createState() => _ServicesPageState2();
}

class _ServicesPageState2 extends State<ServicesPage2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            Name: widget.service.name,
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Theme.of(context).colorScheme.background,
                  height: 2,
                ),
                // Banner
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      borderRadius: BorderRadius.circular(18),
                      elevation: 8,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(widget.service.banner)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // put the banner here to show .TODO
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.service.price,
                      style: TextStyle(
                          fontFamily: 'Caladea',
                          fontSize: 30,
                          color: Colors.red.shade400),
                    ),
                    Text(
                      widget.service.desc,
                      style:
                          const TextStyle(fontSize: 16, fontFamily: 'Caladea'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Benefits',
                      style: TextStyle(
                          fontFamily: 'Caladea',
                          fontSize: 30,
                          color: Colors.red.shade400),
                    ),
                    Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        children: List.generate(widget.service.benefits.length,
                            (index) {
                          return Material(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(9),
                            child: SizedBox(
                              width: 250,
                              height: 280,

                              // Add margin between containers
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                            'lib/assets/banner.png'),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        widget.service.benefits[index],
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 900,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(),
              child: ListView.builder(
                itemCount: widget.service.plans.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedContainer(
                      service: widget.service,
                      index: index,
                      benefits: widget.service.plans[index].benefits,
                      name: widget.service.plans[index].name,
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

class ElevatedContainer extends StatelessWidget {
  final List<String> benefits;
  final MyService service;
  final String name;
  final int index;

  const ElevatedContainer({
    super.key,
    required this.name,
    required this.benefits,
    required this.index, required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFFFFF1F1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                Image.asset(
                  'lib/assets/kitchen_king.png',
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 10.0),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height:
                benefits.length * 35, // Adjust the height based on your needs
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: benefits.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 6,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Text(
                            benefits[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(index: index, service: service,),
                    ),
                  );
                },
                child: Container(
                  height: 26.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    border: Border.all(color: Colors.black),
                    color: Colors.red.shade400,
                  ),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}


// class ElevatedContainer extends StatelessWidget {
//   List<String> benefits;
//   String name;

//   ElevatedContainer({super.key, required this.name, required this.benefits});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.29),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 3,
//             blurRadius: 7,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             child: Row(
//               children: [
//                 Image.asset(
//                   'lib/assets/kitchen_king.png',
//                   width: 25,
//                   height: 25,
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   name, // Change index here as needed
//                   style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     color: Colors.red.shade400,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//                 itemCount: benefits.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 3,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             name,
//             style: TextStyle(
//               color: Colors.red,
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: benefits.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: EdgeInsets.symmetric(vertical: 6.0),
//                 child: Text(
//                   benefits[index],
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14.0,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//                 }),
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 height: 24,
//                 width: 120,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     border: Border.all(color: Colors.black),
//                     color: Colors.red.shade400),
//                 child: Center(
//                   child: Text(
//                     'Continue',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
