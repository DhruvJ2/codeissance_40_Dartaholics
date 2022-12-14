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
    apiKey: 'AIzaSyDraHizA9JtUWoGh2Fq_TCEXtDp33Uc_uo',
    appId: '1:54606607022:web:16476439b7bbba9c07b33f',
    messagingSenderId: '54606607022',
    projectId: 'talkup-8aacd',
    authDomain: 'talkup-8aacd.firebaseapp.com',
    storageBucket: 'talkup-8aacd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhG5rBHWhD34fqgiYYPxFcIgPE-ucqxT4',
    appId: '1:54606607022:android:dc09431449c152a907b33f',
    messagingSenderId: '54606607022',
    projectId: 'talkup-8aacd',
    storageBucket: 'talkup-8aacd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBErQvqaZT6iz-xSFw94DOZMeB5T7D_k1s',
    appId: '1:54606607022:ios:966bd303231718d407b33f',
    messagingSenderId: '54606607022',
    projectId: 'talkup-8aacd',
    storageBucket: 'talkup-8aacd.appspot.com',
    iosClientId: '54606607022-279amfnrc6u80onkg59beojb5fui8u1r.apps.googleusercontent.com',
    iosBundleId: 'com.example.dartaholics',
  );
}
