// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwyji4W8VFyyOwNmFTzddfr3Ws6TS7aM8',
    appId: '1:265885643919:android:47079cdc0c1fd45e166cfa',
    messagingSenderId: '265885643919',
    projectId: 'thehomy-d4fb8',
    databaseURL: 'https://thehomy-d4fb8-default-rtdb.firebaseio.com',
    storageBucket: 'thehomy-d4fb8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6iC5pIg0haEOSu0mM6LGbPJxeMsDLtbo',
    appId: '1:265885643919:ios:26b949021f7d24da166cfa',
    messagingSenderId: '265885643919',
    projectId: 'thehomy-d4fb8',
    databaseURL: 'https://thehomy-d4fb8-default-rtdb.firebaseio.com',
    storageBucket: 'thehomy-d4fb8.appspot.com',
    iosBundleId: 'com.example.theHomy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6iC5pIg0haEOSu0mM6LGbPJxeMsDLtbo',
    appId: '1:265885643919:ios:26b949021f7d24da166cfa',
    messagingSenderId: '265885643919',
    projectId: 'thehomy-d4fb8',
    databaseURL: 'https://thehomy-d4fb8-default-rtdb.firebaseio.com',
    storageBucket: 'thehomy-d4fb8.appspot.com',
    iosBundleId: 'com.example.theHomy',
  );

}