import 'package:firebasetwo/Costom%20Widgets/RountButtom.dart';
import 'package:firebasetwo/UI/Post%20Screen/PostScreen.dart';
import 'package:firebasetwo/UI/auth/SingupScreen.dart';
import 'package:firebasetwo/UI/auth/login_With_PhoneNumber.dart';
import 'package:firebasetwo/Utllis/Utllis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController EmailContoloer = TextEditingController();
  final TextEditingController PasswordContoloer = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool Lodin = false;

  @override
  void deactivate() {
    super.deactivate();
    EmailContoloer.dispose();
    PasswordContoloer.dispose();
  }

  void Login() {
    setState(() {
      Lodin = true; //
    });
    _auth
        .signInWithEmailAndPassword(
        email: EmailContoloer.text.toString(),
        password: PasswordContoloer.text.toString())
        .then((value) {
      Utllis().tostMassage("Logged in as: ${value.user!.email.toString()}");
      setState(() {
        Lodin = false;
      });
      Get.to(() => PostScreen()); //
    }).catchError((error) {
      setState(() {
        Lodin = false; //
      });
      Utllis().tostMassage(error.message.toString()); //
    });
  }

  final _FormKay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Login Screen'),
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
                            label: Text('Email'),
                            hintText: ' ABC@email.com',
                            suffixIcon: Icon(Icons.alternate_email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Email Sir';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: PasswordContoloer,
                          decoration: InputDecoration(
                            label: Text('Password'),
                            hintText: 'A2345@45',
                            suffixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(33),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Password Sir';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 19,
                ),
                RountButtom(
                  title: 'Login',
                  Loding: Lodin,
                  onTab: () {
                    if (_FormKay.currentState!.validate()) {
                      Login();
                    }
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SingupScreen());
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(height: 17,),
                InkWell(
                  onTap: (){
                    Get.to(Login_with_Phone_Number());
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black,),
                      borderRadius: BorderRadius.circular(23),
                    ),
                    height: 55,
                    width: double.infinity,
                    child: Text('Login With Phone Number '),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
