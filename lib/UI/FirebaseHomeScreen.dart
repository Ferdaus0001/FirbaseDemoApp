import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseHomeScreen extends StatefulWidget {
  const FirebaseHomeScreen({super.key});

  @override
  State<FirebaseHomeScreen> createState() => _FirebaseHomeScreenState();
}

class _FirebaseHomeScreenState extends State<FirebaseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
      child: Center(
        child: Text('Home Screen '),
      ),
    ),);
  }
}
