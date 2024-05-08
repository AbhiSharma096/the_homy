import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  final String verificationID;
  final String phonenumber;
  const OTPPage(
      {super.key, required this.verificationID, required this.phonenumber});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFF8F8),
        body: Padding(
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
                  style: TextStyle(fontSize: 18, fontFamily: 'Poopins'),
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
                  onSubmitted: (value) {
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
                const Text(
                  'OTP not recieved? 00:59',
                  style: TextStyle(fontSize: 14, fontFamily: 'Poopins'),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Resend OTP',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poopins'),
                    )),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: GestureDetector(
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
}
