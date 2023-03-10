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
    apiKey: 'AIzaSyCxN0lmJYrbA47wMq5XOxnxzGChV-Pm4ro',
    appId: '1:6339132216:web:063385fbc6ec578b5edfcd',
    messagingSenderId: '6339132216',
    projectId: 'moviesapp-efeda',
    authDomain: 'moviesapp-efeda.firebaseapp.com',
    storageBucket: 'moviesapp-efeda.appspot.com',
    measurementId: 'G-YWYERFJ2TQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz1CLpHuHlrkYMCPuq4BXfjOQYhdtnqR4',
    appId: '1:6339132216:android:aef8676aec2063385edfcd',
    messagingSenderId: '6339132216',
    projectId: 'moviesapp-efeda',
    storageBucket: 'moviesapp-efeda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaX7dLLzhA3wtyod1bu6KSyQeQj16L69o',
    appId: '1:6339132216:ios:7c5dc545f9a2e3d55edfcd',
    messagingSenderId: '6339132216',
    projectId: 'moviesapp-efeda',
    storageBucket: 'moviesapp-efeda.appspot.com',
    iosClientId: '6339132216-n1anv5embh0v2iiqqu669e7t9dkqomt3.apps.googleusercontent.com',
    iosBundleId: 'com.example.movies',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaX7dLLzhA3wtyod1bu6KSyQeQj16L69o',
    appId: '1:6339132216:ios:701e043af96251245edfcd',
    messagingSenderId: '6339132216',
    projectId: 'moviesapp-efeda',
    storageBucket: 'moviesapp-efeda.appspot.com',
    iosClientId: '6339132216-s6gkbcdh7paaitsbbidkph4rodjd8qhh.apps.googleusercontent.com',
    iosBundleId: 'com.example.movies.RunnerTests',
  );
}
