import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/screens/SignUp_Screen.dart';
import 'package:chat_it/size_config.dart';
import 'package:chat_it/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'Home_Screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  // AuthMethods authMethods = AuthMethods();

  bool showSpinner = false;
  bool showError = false;

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
            // InputField(hintText: 'Username', pass: false,),
            Container(
              width: SizeConfig().width(context) * 0.80,
              height: SizeConfig().heigth(context) * 0.08,
              child: TextField(


                controller: emailController,
                obscureText: false,
                style: textStyle.copyWith(
                  fontSize: SizeConfig().heigth(context) * 0.025,
                  color: Colors.blue.shade500,
                ),
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.02,
                    color: Colors.blue.shade700,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),

                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),
            // InputField(hintText: 'Password', pass: true,),
            Container(
              width: SizeConfig().width(context) * 0.80,
              height: SizeConfig().heigth(context) * 0.08,
              child: TextField(
                controller: passController,
                obscureText: true,
                style: textStyle.copyWith(
                  fontSize: SizeConfig().heigth(context) * 0.025,
                  color: Colors.blue.shade500,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.02,
                    color: Colors.blue.shade700,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),

                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),

            SignInButton(
              onTap: () async{

                setState(() {
                  showSpinner = true;
                });
                try {
                  final signInUser = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text);

                  // print(signInUser.user);
                  if(signInUser != null) {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                    setSignedIn(true);
                  }
                } on FirebaseAuthException catch (e){
                  print(e.code);

                  if(e.code == 'wrong-password'){
                    print('baka!!! khoto chhe!!!');
                    setState(() {
                      showError = true;
                    });
                  }
                }

                setState(() {
                  showSpinner = false;
                });
              },
              gradient: SignInButtonGradient,
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

            showError ? Padding(
              padding: EdgeInsets.all(SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'E-mail or Password is wrong.',
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
                  Navigator.pushNamed(context, SignUpScreen.id);
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
            )
          ],
        ),
      ),
    );
  }
}


