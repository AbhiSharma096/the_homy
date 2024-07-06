import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/component/color.dart';
import 'package:the_homy/model/user.dart';
import 'package:the_homy/pages/navigation_menu.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/utils/utils.dart';

class LoginPage extends StatefulWidget {
  final Function() onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                                padding: EdgeInsets.all(6),
                                child: Icon(Icons.arrow_back_ios_new)))),
                  ),
                  const Text(
                    'WELCOME BACK!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 32),
                  ),
                  const SizedBox(
                    width: 40,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Image.asset('lib/assets/login_image.png'),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Login with number',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              "+91",
                              style: TextStyle(
                                color: Color(0xFFb2b7bf),
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(
                                width:
                                    8), // Add some space between "+91" and the TextFormField
                            Expanded(
                              child: TextFormField(
                                
                                cursorColor: Colors.red.shade400,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Phone Number';
                                  }
                                  return null;
                                },
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    color: Color(0xFFb2b7bf),
                                    fontSize: 18.0,
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
              
             const SizedBox(
                height: 60,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor),
                width: MediaQuery.of(context).size.width * .85,
                height: 55,
                child: TextButton(
                    onPressed: () async {
                      if (_phoneNumberController.text.length==10) {
                                
                                // If all fields are filled up, execute sendPhoneNo method
                                
                                  sendPhoneNo();
                                
                                 
                                
                              } else {
                                // If any field is not filled up, show error messages
                                // You can use the validator functions attached to each TextFormField
                              }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?  '),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.red.shade300),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendPhoneNo() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = _phoneNumberController.text.trim();
    ap.signInWithPhone(
        context,
        '+91$phoneNumber',
        null);
  }
}
