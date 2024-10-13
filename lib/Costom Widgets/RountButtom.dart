import 'package:flutter/material.dart';

class RountButtom extends StatelessWidget {

  final String title;
  final VoidCallback onTab;
  final  bool Loding    ;
  RountButtom({super.key, required this.title, required this.onTab,
     this.Loding = false,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTab,

      child: Container(

        height: 55,
        child: Center(
          child:Loding? CircularProgressIndicator(color: Colors.white,):
          Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
