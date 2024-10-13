import 'package:firebasetwo/Firebase%20Serveses/firebase_serveses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({super.key});


  @override

  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  Splashserveses splashserveses = Splashserveses();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    splashserveses.isloging();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(' Splash Screen ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        ),
      ),
    );
  }
}
