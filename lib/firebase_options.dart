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
    apiKey: 'AIzaSyBKa9Kk24LekGjbvn7p0xHOO8RMqP2LmYo',
    appId: '1:621908092432:web:211385ac3717da4ff68c95',
    messagingSenderId: '621908092432',
    projectId: 'quiz-login-register-214ae',
    authDomain: 'quiz-login-register-214ae.firebaseapp.com',
    storageBucket: 'quiz-login-register-214ae.appspot.com',
    measurementId: 'G-8K5W54YB7B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKLKMhRiixUF6IZ-ZHi2gYp1Zx76CVeq8',
    appId: '1:621908092432:android:e041338f651210e2f68c95',
    messagingSenderId: '621908092432',
    projectId: 'quiz-login-register-214ae',
    storageBucket: 'quiz-login-register-214ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2av_W4XQDqBcbezLwqsGmhZF4v5sOp7I',
    appId: '1:621908092432:ios:6eebd0450d773772f68c95',
    messagingSenderId: '621908092432',
    projectId: 'quiz-login-register-214ae',
    storageBucket: 'quiz-login-register-214ae.appspot.com',
    iosBundleId: 'com.example.flutterQuiz2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2av_W4XQDqBcbezLwqsGmhZF4v5sOp7I',
    appId: '1:621908092432:ios:6eebd0450d773772f68c95',
    messagingSenderId: '621908092432',
    projectId: 'quiz-login-register-214ae',
    storageBucket: 'quiz-login-register-214ae.appspot.com',
    iosBundleId: 'com.example.flutterQuiz2',
  );
}
