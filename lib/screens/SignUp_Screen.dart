
import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/componants.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/Sign_In_Up_Componants/sign_in_up_inputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'Home_Screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),

      body: Column(
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
          InputField(hintText: 'E-mail', pass: true),
          SizedBox(
            height: SizeConfig().heigth(context) * 0.02,
          ),
          InputField(hintText: 'Password', pass: true,),
          SizedBox(
            height: SizeConfig().heigth(context) * 0.02,
          ),

          InputField(hintText: 'Confirm Password', pass: true),

          SizedBox(
            height: SizeConfig().heigth(context) * 0.02,
          ),
          SignInButton(
            onTap: (){

              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
            gradient: SignUpButtonGradient,
            child: Center(
              child: Text(
                "Sign Up",
                style: textStyle.copyWith(
                  fontSize: SizeConfig().heigth(context) * 0.035,
                  letterSpacing: SizeConfig().width(context) * 0.001,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
