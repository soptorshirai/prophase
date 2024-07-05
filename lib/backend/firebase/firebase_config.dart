import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDl3BWX3kn4-Gfmgop13BXrdypAfh4UYqg",
            authDomain: "technovation-razzy-pies-ck0ngx.firebaseapp.com",
            projectId: "technovation-razzy-pies-ck0ngx",
            storageBucket: "technovation-razzy-pies-ck0ngx.appspot.com",
            messagingSenderId: "425070391594",
            appId: "1:425070391594:web:848baffa83ee9a6922ae53"));
  } else {
    await Firebase.initializeApp();
  }
}
