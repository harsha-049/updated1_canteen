import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyCGMXqRlS3ZVzkh_Uq6jxT7W44Ed3ZDGA4",
    authDomain: "canteen-food-app-45053.firebaseapp.com",
    projectId: "canteen-food-app-45053",
    storageBucket: "canteen-food-app-45053.firebasestorage.app",
    messagingSenderId: "846237667847",
    appId: "1:846237667847:web:572fb4315cec7f4a31d0a2",
    measurementId: "G-XML695EN58",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCGMXqRlS3ZVzkh_Uq6jxT7W44Ed3ZDGA4",
    appId: "1:846237667847:web:572fb4315cec7f4a31d0a2",
    messagingSenderId: "846237667847",
    projectId: "canteen-food-app-45053",
    storageBucket: "canteen-food-app-45053.firebasestorage.app",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyCGMXqRlS3ZVzkh_Uq6jxT7W44Ed3ZDGA4",
    appId: "1:846237667847:web:572fb4315cec7f4a31d0a2",
    messagingSenderId: "846237667847",
    projectId: "canteen-food-app-45053",
    storageBucket: "canteen-food-app-45053.firebasestorage.app",
    iosClientId: "REPLACE_WITH_YOUR_IOS_CLIENT_ID",
    iosBundleId: "REPLACE_WITH_YOUR_IOS_BUNDLE_ID",
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyCGMXqRlS3ZVzkh_Uq6jxT7W44Ed3ZDGA4",
    appId: "1:846237667847:web:572fb4315cec7f4a31d0a2",
    messagingSenderId: "846237667847",
    projectId: "canteen-food-app-45053",
    storageBucket: "canteen-food-app-45053.firebasestorage.app",
    iosClientId: "REPLACE_WITH_YOUR_MACOS_CLIENT_ID",
    iosBundleId: "REPLACE_WITH_YOUR_MACOS_BUNDLE_ID",
  );
}
