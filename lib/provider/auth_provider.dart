import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_homy/onboarding.dart/onboarding_view.dart';
import 'package:the_homy/pages/otp_screen.dart';
import 'package:the_homy/model/user.dart';
import 'package:the_homy/utils/utils.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool _isOnboarded = false;
  bool _isLoading = false;
  bool _userLoading = false;
  String? _uid;
  MyUser? _myUser = null;
  int? _avatar;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isOnboarded => _isOnboarded;
  int? get avatar => _avatar;
  bool get isSignedIn => _isSignedIn;
  bool get isLoading => _isLoading;
  bool get userLoading => _userLoading;
  String get uid => _uid!;
  MyUser? get myUser => _myUser!;

  AuthProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _checkOnboarding();
    await _checkSignIn();
    await _checkAvatar();
    await getUser();
  }

  Future<void> _checkOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isOnboarded = prefs.getBool('is_onboarded') ?? false;
    notifyListeners();
  }

  Future<void> _checkSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSignedIn = prefs.getBool("is_signed_in") ?? false;
    notifyListeners();
  }

  Future<void> setSignin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  Future<void> setSignout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_signed_in', false);
    _isSignedIn = false;
    _uid = null;
    notifyListeners();
    await _firebaseAuth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnboardingView()));
  }

  Future<void> signInWithPhone(
      BuildContext context, String phoneNumber, MyUser? user) async {
    _setLoading(true);
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException error) {
          throw Exception(error.message);
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPPage(
                verificationID: verificationId,
                phonenumber: phoneNumber,
                user: user,
              ),
            ),
          );
          _setLoading(false);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      _setLoading(false);
      showSnakBar(context, e.toString());
    }
  }

  Future<void> verifyOTP({
    required BuildContext context,
    required String verificationID,
    required String userOTP,
    required Function onSuccess,
  }) async {
    _setLoading(true);
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: userOTP,
      );
      User? user = (await _firebaseAuth.signInWithCredential(credential)).user;
      _uid = user?.uid;
      onSuccess();
      _setLoading(false);
    } catch (e) {
      showSnakBar(context, e.toString());
      _setLoading(false);
    }
  }

  Future<bool> checkExistingUser() async {
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('Users');
    String uid = _firebaseAuth.currentUser?.uid ?? '';
    DataSnapshot dataSnapshot = await reference.child(uid).once().then((event) {
      return event.snapshot;
    });

    return dataSnapshot.exists;
  }

  Future<void> setUser(MyUser user) async {
    _setLoading(true);
    DatabaseReference reference =
        FirebaseDatabase.instance.ref().child('Users');
    await reference.child(_uid!).set(user.toJson());
    _setLoading(false);
  }

  Future<void> getUser() async {
    if (_firebaseAuth.currentUser == null) return;

    _setUserLoading(true);
    DatabaseReference reference =
        await FirebaseDatabase.instance.ref().child('Users');
    String uid = await _firebaseAuth.currentUser!.uid;
    DataSnapshot dataSnapshot = await reference.child(uid).get();
    _myUser = MyUser.fromJson(dataSnapshot.value as Map);
    print(_myUser?.userName);
    _setUserLoading(false);
  }

  Future<void> _checkAvatar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _avatar = prefs.getInt('avatar') ?? 1; // Set default value to 1
    notifyListeners();
  }

  Future<void> setAvatar(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('avatar', value);
    _avatar = value;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setUserLoading(bool value) {
    _userLoading = value;
    notifyListeners();
  }
}
