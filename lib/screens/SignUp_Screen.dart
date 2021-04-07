
import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:chat_it/utils/auth.dart';
import '../size_config.dart';
import 'Home_Screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();


  FirebaseAuth _auth = FirebaseAuth.instance;
  // AuthMethods authMethods = AuthMethods();

  bool showSpinner = false;
  bool showPassError = false;
  bool showEmailInUseError = false;
  bool showWeakPassError = false;
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


            // text field for Username
            Container(
              width: SizeConfig().width(context) * 0.80,
              height: SizeConfig().heigth(context) * 0.08,
              child: TextField(


                controller: userNameController,
                obscureText: false,
                style: textStyle.copyWith(
                  fontSize: SizeConfig().heigth(context) * 0.025,
                  color: Colors.blue.shade500,
                ),
                decoration: InputDecoration(
                  hintText: 'Username',
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
            // text field for E-mail
            // InputField(hintText: 'E-mail', pass: true, controller: email),
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

            // text field for Password
            // InputField(hintText: 'Password', pass: true, controller: pass,),
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

            // text field for Confirm Password
            // InputField(hintText: 'Confirm Password', pass: true, controller: con_pass,),
            Container(
              width: SizeConfig().width(context) * 0.80,
              height: SizeConfig().heigth(context) * 0.08,
              child: TextField(

                controller: conPassController,
                obscureText: true,
                style: textStyle.copyWith(
                  fontSize: SizeConfig().heigth(context) * 0.025,
                  color: Colors.blue.shade500,
                ),
                decoration: InputDecoration(

                  hintText: 'Confirm Password',
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
                  showSpinner  = true;
                });
                try{
                  if(passController.text == conPassController.text){

                    final signUpUser = await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passController.text);

                    if(signUpUser != null){
                      Navigator.pushReplacementNamed(context, HomeScreen.id);
                      Map<String, String> UserInfoMap = {
                        'email' : emailController.text,
                        'username' : userNameController.text,
                      };

                      setUserName(userNameController.text); 
                      setEmail(emailController.text);
                      FireStoreMethods().uploadUserNameAndEmailToFireStore(UserInfoMap);
                    }
                  } else{
                    setState(() {
                      showPassError = true;
                    });
                  }

                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  if(e.code == 'email-already-in-use'){
                    setState(() {
                      showEmailInUseError = true;
                    });
                  }

                  if(e.code == 'weak-password'){
                    setState(() {
                      showWeakPassError = true;
                    });
                  }
                }

                setState(() {
                  showSpinner = false;
                });

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

            showPassError ? Padding(
              padding: EdgeInsets.all(SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Passwords are not same.',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),
            showEmailInUseError ? Padding(
              padding: EdgeInsets.all(SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Given E-mail is in already use.',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),

            showWeakPassError ? Padding(
              padding: EdgeInsets.all(SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Entered Password is weak.',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),
          ],
        ),
      ),
    );

  }
}
