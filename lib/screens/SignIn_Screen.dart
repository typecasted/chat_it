import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/componants.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/Sign_In_Up_Componants/sign_in_up_inputField.dart';
import 'package:chat_it/size_config.dart';
import 'package:flutter/material.dart';

import 'Home_Screen.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          InputField(hintText: 'Username', pass: false,),
          SizedBox(
            height: SizeConfig().heigth(context) * 0.02,
          ),
          InputField(hintText: 'Password', pass: true,),
          SizedBox(
            height: SizeConfig().heigth(context) * 0.02,
          ),

          SignInButton(
            onTap: (){
              Navigator.pushNamed(context, HomeScreen.id);
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
        ],
      ),
    );
  }
}


