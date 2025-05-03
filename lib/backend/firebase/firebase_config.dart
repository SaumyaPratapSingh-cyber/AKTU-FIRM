import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCuMzCfyJ7P7Oa0QbOcElJxf0Qy0k_ZvLU",
            authDomain: "quiz-ddj6d4.firebaseapp.com",
            projectId: "quiz-ddj6d4",
            storageBucket: "quiz-ddj6d4.firebasestorage.app",
            messagingSenderId: "464219351518",
            appId: "1:464219351518:web:186704b34cc73fb13a954f"));
  } else {
    await Firebase.initializeApp();
  }
}
