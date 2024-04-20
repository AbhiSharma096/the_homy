import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_homy/component/back_button.dart';
import 'package:the_homy/component/color.dart';
import 'package:the_homy/pages/homepage.dart';
import 'package:the_homy/pages/navigation_menu.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body:  SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   GestureDetector(
                    onTap: widget.onTap,
                     child: Padding(
                               padding: EdgeInsets.only(left: 20),
                               child: Container(
                                   decoration: BoxDecoration(
                                       border: Border.all(color: Colors.black),
                                       borderRadius: BorderRadius.circular(10)),
                                   child: Padding(
                                       padding: EdgeInsets.all(6),
                                       child: Icon(Icons.arrow_back_ios_new)))),
                   ),
                  Text(
                    'WELCOME BACK!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 32),
                  ),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
              SizedBox(height: 25,),
              Image.asset('lib/assets/login_image.png'),
              SizedBox(height: 20,),
              Container(alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Login with number',style: TextStyle(fontSize: 20,fontFamily: 'Poppins'),),),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * .85,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.red.shade400,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Color(0xFFb2b7bf),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 60,),
              
              Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: primaryColor),
                    width: MediaQuery.of(context).size.width * .85,
                    height: 55,
                    child: TextButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigationMenu()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        )),
                  )
              ,SizedBox(height: 20,),
              Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Dont have an account?  '),GestureDetector(onTap:widget.onTap, child: Text('Signup',style: TextStyle(color: Colors.red.shade300),))],),)
            ],
          ),
        ),
      ),
    );
  }
}

