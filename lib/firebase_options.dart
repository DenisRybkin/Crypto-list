// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBz8F5LaQUS2MHvZZnmPrTvJrFqprT1a2Y',
    appId: '1:1038893807322:web:201b208a2bbd4b983717e3',
    messagingSenderId: '1038893807322',
    projectId: 'crypto-list-app-1916',
    authDomain: 'crypto-list-app-1916.firebaseapp.com',
    storageBucket: 'crypto-list-app-1916.appspot.com',
    measurementId: 'G-VL84YBDF57',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChzCtfeHR_LqwzN5FxB1d0qEUB2vS2Tic',
    appId: '1:1038893807322:android:97b3b1e5a42378fe3717e3',
    messagingSenderId: '1038893807322',
    projectId: 'crypto-list-app-1916',
    storageBucket: 'crypto-list-app-1916.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIte8ehsYmAEz6fVo1AwAd7EZ-IK2mzV0',
    appId: '1:1038893807322:ios:1a8248d048ed7dc33717e3',
    messagingSenderId: '1038893807322',
    projectId: 'crypto-list-app-1916',
    storageBucket: 'crypto-list-app-1916.appspot.com',
    iosClientId: '1038893807322-ap75b64mfgcaatjac8523ju7lir3hm8a.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIte8ehsYmAEz6fVo1AwAd7EZ-IK2mzV0',
    appId: '1:1038893807322:ios:acd660c793ec48f63717e3',
    messagingSenderId: '1038893807322',
    projectId: 'crypto-list-app-1916',
    storageBucket: 'crypto-list-app-1916.appspot.com',
    iosClientId: '1038893807322-h4l1je0mopt9poupsdnoa1t64h095r7f.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppExample.RunnerTests',
  );
}