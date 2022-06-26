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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA31dEt9m9LC7jMF8XSdxTQnkZSLJoTdR8',
    appId: '1:814443561426:web:fc43c556f091ba5203080b',
    messagingSenderId: '814443561426',
    projectId: 'fuego-cafe-d52c5',
    authDomain: 'fuego-cafe-d52c5.firebaseapp.com',
    storageBucket: 'fuego-cafe-d52c5.appspot.com',
    measurementId: 'G-T4Z05KL4XQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACOlceyKIcHn9VDtjRh0VZDjlsW38gRxI',
    appId: '1:814443561426:android:84d083ddfc58098303080b',
    messagingSenderId: '814443561426',
    projectId: 'fuego-cafe-d52c5',
    storageBucket: 'fuego-cafe-d52c5.appspot.com',
  );
}