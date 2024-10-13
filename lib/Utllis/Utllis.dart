import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utllis {
  void tostMassage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red.shade900  ,
      textColor: Colors.white ,//
      fontSize: 16.0,
    );
  }
}
