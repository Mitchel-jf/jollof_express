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
    apiKey: 'AIzaSyDZfEwhcBbPSL_W6uPnGlooJHdXPD0aMYs',
    appId: '1:781979354708:web:4444a64b6b7d5f8fb2cfc1',
    messagingSenderId: '781979354708',
    projectId: 'jollof-express',
    authDomain: 'jollof-express.firebaseapp.com',
    storageBucket: 'jollof-express.appspot.com',
    measurementId: 'G-9RV20SKNGN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJouZeSJWApK3bSJ2FJ4JIeL_v7XGiwh4',
    appId: '1:781979354708:android:769c4668e65fd482b2cfc1',
    messagingSenderId: '781979354708',
    projectId: 'jollof-express',
    storageBucket: 'jollof-express.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANm4YF3FlixgmnvlkPGU-QROxgXZoVVDs',
    appId: '1:781979354708:ios:efd5bbfec9543271b2cfc1',
    messagingSenderId: '781979354708',
    projectId: 'jollof-express',
    storageBucket: 'jollof-express.appspot.com',
    iosClientId: '781979354708-5lctcif6arf0du5v5fvkh2s2t81kkdna.apps.googleusercontent.com',
    iosBundleId: 'com.jollofexpress.jollofExpress',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANm4YF3FlixgmnvlkPGU-QROxgXZoVVDs',
    appId: '1:781979354708:ios:5c8bf2932c8da108b2cfc1',
    messagingSenderId: '781979354708',
    projectId: 'jollof-express',
    storageBucket: 'jollof-express.appspot.com',
    iosClientId: '781979354708-7eg8pcv69c83mqrhthmb3d6rrmkbved7.apps.googleusercontent.com',
    iosBundleId: 'com.jollofexpress.jollofExpress.RunnerTests',
  );
}
