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
    apiKey: 'AIzaSyAHwxVOBUqwM00j9U5FWxyPq6CtSicAtMc',
    appId: '1:915124782188:web:e510fdf4fa275bfb664449',
    messagingSenderId: '915124782188',
    projectId: 'instagram-a832e',
    authDomain: 'instagram-a832e.firebaseapp.com',
    storageBucket: 'instagram-a832e.appspot.com',
    measurementId: 'G-BQGXTW8GWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDi3ylX2AGbe6JGpyZA1yBWpNyJ8VX82is',
    appId: '1:915124782188:android:82a48a74569cdfaf664449',
    messagingSenderId: '915124782188',
    projectId: 'instagram-a832e',
    storageBucket: 'instagram-a832e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXDhwdK_I9daOw-jW8mILGqLMvpfEzAHs',
    appId: '1:915124782188:ios:90581d5cc49723ad664449',
    messagingSenderId: '915124782188',
    projectId: 'instagram-a832e',
    storageBucket: 'instagram-a832e.appspot.com',
    androidClientId: '915124782188-3nqc4o1r2biqbugpnl1oi9vmf3537dme.apps.googleusercontent.com',
    iosClientId: '915124782188-fujobm7cbvgrpo05sqr5b07865ntgnql.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXDhwdK_I9daOw-jW8mILGqLMvpfEzAHs',
    appId: '1:915124782188:ios:92a8119e8265a1da664449',
    messagingSenderId: '915124782188',
    projectId: 'instagram-a832e',
    storageBucket: 'instagram-a832e.appspot.com',
    androidClientId: '915124782188-3nqc4o1r2biqbugpnl1oi9vmf3537dme.apps.googleusercontent.com',
    iosClientId: '915124782188-un5aiabo2vdjbdt2gvh75rf5tfrmvgr5.apps.googleusercontent.com',
    iosBundleId: 'com.example.instagram.RunnerTests',
  );
}