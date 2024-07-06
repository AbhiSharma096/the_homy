import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/model/user.dart';
import 'package:the_homy/pages/navigation_menu.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/utils/utils.dart';

class OTPPage extends StatefulWidget {
  final String verificationID;
  final String phonenumber;
  final MyUser? user;
  const OTPPage(
      {super.key,
      required this.verificationID,
      required this.phonenumber,
      this.user});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
        backgroundColor: const Color(0xFFFFF8F8),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      const Text(
                        'Verification',
                        style: TextStyle(fontSize: 42, fontFamily: 'Poopins'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'lib/assets/otp_image.png',
                        height: 280,
                        width: 280,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Please enter the 6 digit code sent on',
                        style: TextStyle(fontSize: 18, fontFamily: 'Poopins'),
                      ),
                      Text(
                        widget.phonenumber,
                        style: const TextStyle(
                            fontSize: 18, fontFamily: 'Poopins'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Pinput(
                        length: 6,
                        showCursor: true,
                        focusedPinTheme: PinTheme(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red.shade400),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                        onCompleted: (value) {
                          setState(() {
                            otpCode = value;
                          });
                        },
                        defaultPinTheme: PinTheme(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // const Text(
                      //   'OTP not recieved? 00:59',
                      //   style: TextStyle(fontSize: 14, fontFamily: 'Poopins'),
                      // ),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      // GestureDetector(
                      //     onTap: () {},
                      //     child: const Text(
                      //       'Resend OTP',
                      //       style:
                      //           TextStyle(fontSize: 14, fontFamily: 'Poopins'),
                      //     )),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: GestureDetector(
                          onTap: () {
                            if (otpCode != null) {
                              verifyOTP(context, otpCode!, widget.user);
                            } else {
                              showSnakBar(
                                  context, "Enter 6 digit verification code");
                            }
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.red.shade400),
                            child: const Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Poopins',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }

  void verifyOTP(BuildContext context, String userOTP, MyUser? user) async {
    //verify otp

    final ap = Provider.of<AuthProvider>(context, listen: false);

    ap.verifyOTP(
        context: context,
        verificationID: widget.verificationID,
        userOTP: userOTP,
        onSuccess: () async {
          ap.checkExistingUser().then((value) async {
            if (value != true) {
              try {
                if (user != null) {
                  await ap.setUser(user);
                } else {
                  showSnakBar(
                      context, "Acount didn't extst, Please SignUp first.");
                  return;
                }
              } on FirebaseException catch (e) {
                showSnakBar(context, e.message.toString());
                return;
              }
              ap.getUser();
              ap.setSignin().then((value) => true);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationMenu(),
                  ),
                  (route) => false);
            } else {
              ap.setSignin().then((value) => true);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationMenu()),
                  (route) => false);
            }
          });
        });
  }
}
