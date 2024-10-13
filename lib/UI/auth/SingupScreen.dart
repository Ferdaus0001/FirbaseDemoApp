import 'package:firebasetwo/Costom%20Widgets/RountButtom.dart';
import 'package:firebasetwo/UI/auth/LoginScreen.dart';
import 'package:firebasetwo/Utllis/Utllis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  bool Loding = false;
  final TextEditingController EmailContoloer = TextEditingController();
  final TextEditingController PasswordContoloer = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    EmailContoloer.dispose();
    PasswordContoloer.dispose();
  }
  void SingUP(){
    setState(() {
      Loding = true;
    });
    _auth
        .createUserWithEmailAndPassword(
        email: EmailContoloer.text.toString(),
        password: PasswordContoloer.text.toString())
        .then((value) {
      setState(() {
        Loding = false;
      });
    }).onError((error, stackTrace) {
      Utllis().tostMassage(error.toString());
      setState(() {
        Loding = false;
      });
    });
  }
  final _FormKay = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sing UP  Screen '),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleSpacing: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _FormKay,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: EmailContoloer,
                        decoration: InputDecoration(
                          label: Text('Email '),
                          hintText: ' ABC@email.com',
                          suffixIcon: Icon(Icons.alternate_email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Enter Your Email Sir ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        controller: PasswordContoloer,
                        decoration: InputDecoration(
                          label: Text('Password '),
                          hintText: 'A2345@45',
                          suffixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(33),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Enter Your Email Sir ';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              RountButtom(
                title: 'Sing Up  ',
                Loding: Loding,
                onTab: () {
                  if (_FormKay.currentState!.validate()) {
                    SingUP();
                  }
                },
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("  have a accoutn "),
                  TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
