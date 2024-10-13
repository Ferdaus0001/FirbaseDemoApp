import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetwo/UI/auth/Add_Post_Screen.dart';
import 'package:firebasetwo/UI/auth/LoginScreen.dart';
import 'package:firebasetwo/Utllis/Utllis.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        titleSpacing: 1,
        title: Text('Post Screen '),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Get.to(LoginScreen());

            }).onError((error, stackTrace) {
               Utllis().tostMassage(error.toString());
            });

          }, icon: CircleAvatar(backgroundColor: Colors.grey.shade200,child: Icon(Icons.logout))),
          SizedBox(width: 11,)
        ],

      ),
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          children: [],
        ),

      ),
      floatingActionButton: FloatingActionButton(


        elevation: 60,
        onPressed: () {

             Get.to( ()=> AddPost());

        },
      child: Icon(Icons.add,color: Colors.blue,size: 29,),
      ),
    );
  }
}
