

import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TabBar(
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelColor: Colors.black54,
        labelColor: Colors.black87,
        labelPadding: const EdgeInsets.only(left: 0, right: 30),
        isScrollable: true,
        indicatorColor: Colors.black87,
        controller: tabController,
        tabs: const [
          Tab(
            child: Text(
              'Offer',
              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            ),
          ),
          Tab(
            child: Text(
              'Plans',
              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            ),
          )
        ],
      ),
    );
  }
}
