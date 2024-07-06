import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_homy/onboarding.dart/onboarding_view.dart';
import 'package:the_homy/pages/homepage.dart';


class AuthGates extends StatelessWidget {
  const AuthGates({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  OnboardingView();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}