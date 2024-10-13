import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// import 'FirHomeScreen/FriebaseHomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'UI/SplashScreen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:   FirebaseOptions(
  apiKey: 'AIzaSyD-lDsv5S4xhCySX9-JEpGB_5NjPkt0-Bs',
    appId: '1:807564432883:android:5398296941315e8f7eee86',
    messagingSenderId: '807564432883',
    projectId: 'fir-two-89ada',
    storageBucket: 'fir-two-89ada.appspot.com',
      databaseURL: 'https://fir-two-89ada-default-rtdb.firebaseio.com'
  ),
  );
  runApp(FirbaseApp());
}

class FirbaseApp extends StatelessWidget {
  const FirbaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpalshScreen(),
    );
  }
}
