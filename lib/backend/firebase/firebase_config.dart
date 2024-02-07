import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDtAMCXDrrtifVGHAtrosk15Dttx_rjl9Y",
            authDomain: "trackllostudent.firebaseapp.com",
            projectId: "trackllostudent",
            storageBucket: "trackllostudent.appspot.com",
            messagingSenderId: "148177471752",
            appId: "1:148177471752:web:dad8b2928c25ff486cc4bd",
            measurementId: "G-LJ8ZCRH6MF"));
  } else {
    await Firebase.initializeApp();
  }
}
