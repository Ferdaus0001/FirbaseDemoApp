import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class varifaiCode extends StatefulWidget {
  final VarificationsId ;
  const varifaiCode({super.key, required this.VarificationsId});

  @override
  State<varifaiCode> createState() => _varifaiCodeState();
}

class _varifaiCodeState extends State<varifaiCode> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Varificode '),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
