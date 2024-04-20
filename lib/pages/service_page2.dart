import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_homy/component/my_tab_bar.dart';
import 'package:the_homy/component/sliver_appbar.dart';

class ServicesPage2 extends StatefulWidget {
  const ServicesPage2({super.key});

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
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      borderRadius: BorderRadius.circular(18),
                      elevation: 8,
                      child: Image.asset('lib/assets/banner.png'),
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
            Container(
              height: 500,
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starting @499',
                      style: TextStyle(
                          fontFamily: 'Caladea',
                          fontSize: 30,
                          color: Colors.red.shade400),
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                      style: TextStyle(fontSize: 12),
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
                        crossAxisCount: 2, // Two containers in each row
                        // Add padding around the grid
                        mainAxisSpacing:
                            16.0, // Add vertical spacing between the containers
                        crossAxisSpacing:
                            16.0, // Add horizontal spacing between the containers
                        children: List.generate(4, (index) {
                          return Material(
                            elevation: 6,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 250,
                              height: 280,

                              margin: EdgeInsets.all(
                                  8.0), // Add margin between containers
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 140,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child:
                                          Image.asset('lib/assets/banner.png'),
                                    ),
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
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
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedContainer(index: index,),
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
  final List<String> categories = ['Homy', 'Homy Pro', 'Homy Pro Max'];
  var index;

  ElevatedContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.29),
        color: Colors.white,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Image.asset(
                  'lib/assets/kitchen_king.png',
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  categories[index], // Change index here as needed
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'advckhadbjhcblsdj',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'advckhadbjhcblsdj',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'advckhadbjhcblsdj',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: GestureDetector(onTap: (){}, child: Container(
              height: 24,width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), border: Border.all(color: Colors.black),color: Colors.red.shade400),
              child: Center(child: Text('Continue',style: TextStyle(color: Colors.white),),),
            ),),
          )
        ],
      ),
    );
  }
}
