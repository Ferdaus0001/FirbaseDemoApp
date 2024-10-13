import 'package:firebasetwo/Costom%20Widgets/RountButtom.dart';
import 'package:firebasetwo/UI/auth/Varificode.dart';
import 'package:firebasetwo/Utllis/Utllis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';


class Login_with_Phone_Number extends StatefulWidget {
  Login_with_Phone_Number({super.key});

  @override
  State<Login_with_Phone_Number> createState() => _Login_with_Phone_NumberState();

}

class _Login_with_Phone_NumberState extends State<Login_with_Phone_Number> {
  bool Loding = false;
  final TextEditingController PhoneNumberContoloer = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text( 'Phone Code '),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
         body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.all(13.0),
             child: Column(
               children: [
                 SizedBox(height: 50,),
                   Form(child: Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       children: [
                         TextFormField(
                           keyboardType: TextInputType.phone,
                           controller: PhoneNumberContoloer,
                           decoration: InputDecoration(
                             label: Text('Phone Number'),
                             suffixIcon: Icon(Icons.password_sharp),
                             hintText: ' 01726******* ',
                             border: OutlineInputBorder(

                               borderRadius: BorderRadius.circular(23),
                             )
                           ),
                         )
                       ],
                     ),
                   )),
                 SizedBox(height: 50,),
                 RountButtom(title: 'Login  ', onTab: (){
                   _auth.verifyPhoneNumber(
                     phoneNumber: PhoneNumberContoloer.text.toString(),
                       verificationCompleted: (_){

                       },
                       verificationFailed: (e){
                       Utllis().tostMassage(e.toString());
                       },
                       codeSent: (String  varyficatiosn , int? toking ){
                       Get.to(varifaiCode(VarificationsId: varyficatiosn,));
                       },
                       codeAutoRetrievalTimeout:  (e){
                         Utllis().tostMassage(e.toString());
                       });
                 })
               ],
             ),
           ),
         ),
    );
  }
}
