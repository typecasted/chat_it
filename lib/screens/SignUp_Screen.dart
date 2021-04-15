
import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
import 'package:chat_it/Componants/Sign_In_Up_Componants/sign_up_inputField.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/screens/OTPScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:chat_it/utils/firebase.dart';
import '../size_config.dart';
import 'SignIn_Screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  // FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController userNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  FireStoreMethods _methods = FireStoreMethods();
  String verificationCode;

  // AuthMethods authMethods = AuthMethods();
  bool userNameFieldIsEmpty = false;
  bool numberFieldIsEmpty = false;

  bool showError = false;
  bool showSpinner = false;
  bool showNumberInUseError = false;
  bool numberNotInUse = true;





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
            InputField(hintText: 'Username', controller: userNameController, textInputType: TextInputType.name,),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),

            // text field for E-mail
            InputField(hintText: 'Number', controller: numberController, textInputType: TextInputType.number,),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.02,
            ),


            SignInButton(
              onTap: () async{

                setState(() {
                  showSpinner  = true;
                });

                if(numberController.text.isEmpty || userNameController.text.isEmpty){
                  if(numberController.text.isEmpty){
                    setState(() {
                      numberFieldIsEmpty = true;
                    });
                  }
                  if(userNameController.text.isEmpty){
                    setState(() {
                      userNameFieldIsEmpty = true;
                    });
                  }
                }else{

                  // after filling details it must not show errors.
                  setState(() {
                    numberFieldIsEmpty = false;
                  });
                  setState(() {
                    userNameFieldIsEmpty = false;
                  });
                  QuerySnapshot query = await FirebaseFirestore.instance.collection('users').where('number', isEqualTo: numberController.text).get();

                  if(query.docs.isEmpty){
                    print("it's null.");
                    print(query.docs.toString());

                    Map<String, String> userInfoMap = {
                      'number' : numberController.text,
                      'username' : userNameController.text
                    };


                    _methods.uploadUserNameAndEmailToFireStore(userInfoMap);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPScreen(numberController.text)));
                  }
                  else{
                    print("it's not null bro!!!!!!!!!!!!!!!!!!!!!!");
                    print(query.docs.toString());
                    setState(() {
                      showNumberInUseError = true;
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


            showNumberInUseError ? Padding(
              padding: EdgeInsets.only(top: SizeConfig().heigth(context) * 0.05, left: SizeConfig().heigth(context) * 0.05, right: SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Given Number is in already use.',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),

            userNameFieldIsEmpty ? Padding(
              padding: EdgeInsets.only(top: SizeConfig().heigth(context) * 0.05, left: SizeConfig().heigth(context) * 0.05, right: SizeConfig().heigth(context) * 0.05),

              child: Center(
                child: Text(
                  'Enter Username',
                  style: textStyle.copyWith(
                    fontSize: SizeConfig().heigth(context) * 0.025,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ) : Container(),

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
              padding: showError ? EdgeInsets.all(0) : EdgeInsets.only(top: SizeConfig().heigth(context) * 0.05, left: SizeConfig().heigth(context) * 0.05, right: SizeConfig().heigth(context) * 0.05),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, SignInScreen.id);
                },
                child: Container(
                  child: Text(
                    'Already have account',
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