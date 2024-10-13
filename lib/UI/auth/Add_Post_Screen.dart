import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetwo/Costom%20Widgets/RountButtom.dart';
import 'package:firebasetwo/Utllis/Utllis.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final postController = TextEditingController();
  bool Loding = false; //
  final databaseRif = FirebaseDatabase.instance.ref('path');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Post Screen '),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 33),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: postController,
                      decoration: InputDecoration(
                        label: Text('Post'),
                        hintText: 'What are you thinking?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    SizedBox(height: 150),
                    RountButtom(
                      title: 'Add Post',
                      Loding:  Loding,

                      onTab: () {
                        setState(() {
                          Loding = true;
                        });
                        databaseRif.child('2').set({
                          "Title ": postController.text.toString(),
                          "ID ": 1,
                        }).then((value) {
                          Utllis().tostMassage('Post Edit ');
                          setState(() {
                            Loding = false;
                          });
                        }).onError((error, stackTrace) {
                          setState(() {
                            Loding = false;

                          });
                          Utllis().tostMassage(error.toString());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
