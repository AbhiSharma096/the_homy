import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_homy/pages/otp_screen.dart';
import 'package:the_homy/utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool _isOnboarded = false;
  bool get isOnborded => _isOnboarded;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthProvider() {
    checkSignIn();
  }

  void onboarding() async {
    final SharedPreferences onb = await SharedPreferences.getInstance();
    _isOnboarded = onb.getBool('is_onboarded') ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OTPPage(
                          verificationID: verificationId,
                          phonenumber: phoneNumber,
                        )));
          },
          codeAutoRetrievalTimeout: (verificationId) {});
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, e.message.toString());
    }
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signed_in") ?? false;
    notifyListeners();
  }

  void verifyOTP(
      {required BuildContext context,
      required String verificationID,
      required String userOTP,
      required Function onSuccess}) async {
    try {
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: userOTP);
      User? user = (await _firebaseAuth.signInWithCredential(cred)).user!;
      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnakBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkexistingUser(BuildContext context) async {
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('Users');

    DataSnapshot dataSnapshot;
    try {
      dataSnapshot =
          await reference.child(_uid!).once().then((event) => event.snapshot);
    } catch (e) {
      showSnakBar(context, e.toString());
      // Handle any errors that occurred during the read
      print('Error reading data: $e');
      return false;
    }
    print(dataSnapshot.value);

    return dataSnapshot.value != null;

    // bool? value;

    // reference.orderByKey().equalTo(_uid).once().then((snapshot) => {
    //       if (!snapshot.snapshot.child(_uid!).exists) {value = false} else {value = true}
    //     });
    // return value!;
  }
}
