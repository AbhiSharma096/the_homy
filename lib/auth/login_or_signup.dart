import 'package:flutter/material.dart';
import 'package:the_homy/pages/login_page.dart';
import 'package:the_homy/pages/signup_page.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {
  bool showSignupPage = true;

  void togglePage() {
    setState(() {
      showSignupPage = !showSignupPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignupPage){
      return SignupPage(onTap: togglePage,);
    }else{
      return LoginPage(onTap: togglePage,);
    }
  }
}
