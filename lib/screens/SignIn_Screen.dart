import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/Sign_In_Up_Componants/sign_up_inputField.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/screens/SignUp_Screen.dart';
import 'package:chat_it/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'OTPScreen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // FirebaseAuth _auth = FirebaseAuth.instance;
  // AuthMethods authMethods = AuthMethods();

  bool numberFieldIsEmpty = false;

  bool showSpinner = false;
  bool showError = false;
  bool popOrNot = false;

  void pop(bool popIt){
    setState(() {
      popOrNot = popIt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),

      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Center(
              child: Text(
                'Chat !t',
                style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.07),
              ),
            ),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.04,
            ),
            InputField(hintText: 'Number', controller: numberController, textInputType: TextInputType.number,),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),
            // InputField(hintText: 'Password', pass: true,),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),

            SignInButton(
              onTap: () async{

                setState(() {
                  showSpinner = true;
                });

                if(numberController.text.isNotEmpty){

                  // after filling details it must not show errors.
                  setState(() {
                    numberFieldIsEmpty = false;
                  });

                  QuerySnapshot query = await FirebaseFirestore.instance.collection('users').where('number', isEqualTo: numberController.text).get();

                  if(query.docs.isNotEmpty){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPScreen(numberController.text)));
                  }
                }else{
                  setState(() {
                    numberFieldIsEmpty = true;
                  });

                }

                setState(() {
                  showSpinner = false;
                });
              },
              gradient: signInButtonGradient,
              child: Center(
                child: Text(
                  "Sign In",
                  style: textStyle.copyWith(
                      fontSize: SizeConfig().heigth(context) * 0.035,
                      letterSpacing: SizeConfig().width(context) * 0.001,
                  ),
                ),
              ),
            ),


            numberFieldIsEmpty ? Padding(
              padding: EdgeInsets.only(top: SizeConfig().heigth(context) * 0.05, left: SizeConfig().heigth(context) * 0.05, right: SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Enter Phone number',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),
            Padding(
              padding: showError ? EdgeInsets.all(0) : EdgeInsets.all(SizeConfig().heigth(context) * 0.02),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, SignUpScreen.id);
                },
                child: Container(
                  child: Text(
                    'Create Account',
                    style: textStyle.copyWith(
                      fontSize: SizeConfig().heigth(context) * 0.02,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}


