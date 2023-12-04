// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDaqKoClEmYsS1Upruqu1KtG7-n57xGXn8',
    appId: '1:24247266424:web:f1daa3ac2290567cc3918d',
    messagingSenderId: '24247266424',
    projectId: 'local-et-toi',
    authDomain: 'local-et-toi.firebaseapp.com',
    storageBucket: 'local-et-toi.appspot.com',
    measurementId: 'G-2WWWZWQ88E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgXb91w0fWcihfGcPoCzqnoU-XsO8eKv4',
    appId: '1:24247266424:android:52571e12aaa01788c3918d',
    messagingSenderId: '24247266424',
    projectId: 'local-et-toi',
    storageBucket: 'local-et-toi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCa1ryjH8D8v4KKgdSkKuRJihhS--Wgf_s',
    appId: '1:24247266424:ios:da99162fda69c763c3918d',
    messagingSenderId: '24247266424',
    projectId: 'local-et-toi',
    storageBucket: 'local-et-toi.appspot.com',
    iosClientId: '24247266424-ku3lsqkfhjl5guihkt839ng7e1e68rv5.apps.googleusercontent.com',
    iosBundleId: 'com.example.localEtToi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCa1ryjH8D8v4KKgdSkKuRJihhS--Wgf_s',
    appId: '1:24247266424:ios:7c2e30f0c5ee3fcfc3918d',
    messagingSenderId: '24247266424',
    projectId: 'local-et-toi',
    storageBucket: 'local-et-toi.appspot.com',
    iosClientId: '24247266424-p9ab9fo261kdho3q1kt4fomminc6a98v.apps.googleusercontent.com',
    iosBundleId: 'com.example.localEtToi.RunnerTests',
  );
}
