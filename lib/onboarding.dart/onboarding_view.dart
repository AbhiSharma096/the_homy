import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_homy/auth/login_or_signup.dart';
import 'package:the_homy/component/color.dart';
import 'package:the_homy/onboarding.dart/onboarding_items.dart';
import 'package:the_homy/pages/navigation_menu.dart';
import 'package:the_homy/provider/auth_provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();
  List number = [];
  Map<dynamic, dynamic> Benefits = {};

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    
    
    

    final ap = Provider.of<AuthProvider>(context, listen: false);

    DatabaseReference _ref = FirebaseDatabase.instance
        .ref()
        .child('Data')
        .child('Combos')
        .child('1');
    // _ref.onValue.listen((event) {
    //   setState(() {
    //     number = event.snapshot.child('Benefit');
    //   });
    // });

    _ref.onValue.listen((event) {
      setState(() {
        final data = event.snapshot.value as Map<dynamic, dynamic>?;
        if (data != null) {
          final benefitsMap = data.map(
            (key, value) => MapEntry(key.toString(), value),
          );
          Benefits = benefitsMap;
        } else {
          Benefits = {}; // or handle the case when data is null
        }
      });
    });
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted(ap)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Skip Button
                  TextButton(
                      onPressed: () => pageController
                          .jumpToPage(controller.items.length - 1),
                      child: const Text('Skip')),

                  //Indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index) => pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeIn),
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: primaryColor,
                    ),
                  ),

                  //Next Button
                  TextButton(
                      onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn),
                      child: const Text("Next")),
                ],
              ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image),
                  const SizedBox(height: 15),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Image.asset('lib/assets/logo.png'),
                ],
              );
            }),
      ),
    );
  }

  //Now the problem is when press get started button
  // after re run the app we see again the onboarding screen
  // so lets do one time onboarding

  //Get started button

  Widget getStarted(AuthProvider ap) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: primaryColor),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () {
            ap.isSignedIn
                ? Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NavigationMenu()))
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginOrSignupPage()));
          },
          child: const Text(
            "Get started",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
