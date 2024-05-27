import 'package:flutter/material.dart';
import 'package:the_homy/component/my_tab_bar.dart';
import 'package:the_homy/component/sliver_appbar.dart';
import 'package:the_homy/pages/service_page2.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List anylist = [];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            Name: 'Reciepe',
            title: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(
                  icon: Text('About'),
                ),
                Tab(
                  icon: Text('Gallery'),
                )
              ],
            ),
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
                          child: Image.asset('lib/assets/banner.png')),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cooking',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.red.shade400),
                      ),
                      Text(
                        'Recipe Name',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                            color: Colors.black),
                      ),
                      
                    ],
                  ),
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
                    Text('About Recipe',style: TextStyle(fontFamily:'Poppins' ,fontSize: 16,fontWeight: FontWeight.normal,color:Colors.red.shade400),),
                  ],
                ),
              ),
            ),
            Container(
              height: 900,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: const BoxDecoration(),
              child: ListView.builder(
                itemCount: anylist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: ElevatedContainer(
                    //   service: widget.service,
                    //   index: index,
                    //   benefits: widget.service.plans[index].benefits,
                    //   name: widget.service.plans[index].name,
                    // ),
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
