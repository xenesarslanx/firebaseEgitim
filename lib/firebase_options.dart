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
    apiKey: 'AIzaSyCiOmfI6utAMs6lfsaDOtFwUlffszeNLDU',
    appId: '1:1025376398672:web:eb2ae86dc727fde63d5055',
    messagingSenderId: '1025376398672',
    projectId: 'project-2795146367022045857',
    authDomain: 'project-2795146367022045857.firebaseapp.com',
    databaseURL: 'https://project-2795146367022045857-default-rtdb.firebaseio.com',
    storageBucket: 'project-2795146367022045857.appspot.com',
    measurementId: 'G-5KDPWVRCQJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm1w54Oea7uiH4dYhQoyUsjYea2-094KE',
    appId: '1:1025376398672:android:edad617986277b483d5055',
    messagingSenderId: '1025376398672',
    projectId: 'project-2795146367022045857',
    databaseURL: 'https://project-2795146367022045857-default-rtdb.firebaseio.com',
    storageBucket: 'project-2795146367022045857.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUk6cY1Es_hWGIvl9p8Ab8hw2uQtdUnkc',
    appId: '1:1025376398672:ios:6fec9410a054ee843d5055',
    messagingSenderId: '1025376398672',
    projectId: 'project-2795146367022045857',
    databaseURL: 'https://project-2795146367022045857-default-rtdb.firebaseio.com',
    storageBucket: 'project-2795146367022045857.appspot.com',
    iosClientId: '1025376398672-kh2pjvo3h43hoj30gu3sbg3bsreu4u2u.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseEgitim',
  );
}
