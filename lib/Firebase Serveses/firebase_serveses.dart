import 'dart:async';

import 'package:firebasetwo/UI/FirebaseHomeScreen.dart';
import 'package:firebasetwo/UI/Post%20Screen/PostScreen.dart';
import 'package:firebasetwo/UI/auth/LoginScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splashserveses{
  void isloging (){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user!= null){
      Timer(Duration(seconds: 3), () {
        Get.to(PostScreen());
      });
    }else{
      Timer(Duration(seconds: 3), () {
        Get.to(LoginScreen());
      });

    }

  }
}