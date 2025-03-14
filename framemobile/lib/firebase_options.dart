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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCTy0i_EGCNH_9g-IDd3WqLmOpR8fjw0Gw',
    appId: '1:981994564753:web:1561ed273a4b9e51dfe330',
    messagingSenderId: '981994564753',
    projectId: 'onlineshoppings-26f37',
    authDomain: 'onlineshoppings-26f37.firebaseapp.com',
    storageBucket: 'onlineshoppings-26f37.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBywMJEh_J7rl6V7CP0qoIbFgYKqYIpZZs',
    appId: '1:981994564753:android:dbe847ed6a502287dfe330',
    messagingSenderId: '981994564753',
    projectId: 'onlineshoppings-26f37',
    storageBucket: 'onlineshoppings-26f37.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD7Igto47Q0xtuNTLIJOVSI1utg2ApHvVE',
    appId: '1:981994564753:ios:2204f538ce3941ccdfe330',
    messagingSenderId: '981994564753',
    projectId: 'onlineshoppings-26f37',
    storageBucket: 'onlineshoppings-26f37.appspot.com',
    androidClientId: '981994564753-kpblilsahk2be4cto55iihad30voucqg.apps.googleusercontent.com',
    iosClientId: '981994564753-h02gs61indihr3j5bu43jc2e3u34jcu6.apps.googleusercontent.com',
    iosBundleId: 'com.example.framemobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCTy0i_EGCNH_9g-IDd3WqLmOpR8fjw0Gw',
    appId: '1:981994564753:web:f3c53a23197916a7dfe330',
    messagingSenderId: '981994564753',
    projectId: 'onlineshoppings-26f37',
    authDomain: 'onlineshoppings-26f37.firebaseapp.com',
    storageBucket: 'onlineshoppings-26f37.appspot.com',
  );
}
