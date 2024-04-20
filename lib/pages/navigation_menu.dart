import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:the_homy/pages/homepage.dart';
import 'package:the_homy/pages/profile_page.dart';
import 'package:the_homy/pages/recent_page.dart';

class NavigationMenu extends StatelessWidget {
  
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationControler());
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                  color: Colors.red.shade300,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.bookmark_2,
                  color: Colors.red.shade300,
                ),
                label: 'Subscription'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.book_saved,
                  color: Colors.red.shade300,
                ),
                label: 'Recent'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.profile_2user,
                  color: Colors.red.shade300,
                ),
                label: 'Profile')
          ],
        ),
      ),
      body: Obx(()=>controller.Screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationControler extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final Screens = [HomePage(),Container(color: Colors.blue[100],),RecentPage(),ProfilePage()];
}
