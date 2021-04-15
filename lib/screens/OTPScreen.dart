


import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/screens/Home_Screen.dart';
import 'package:chat_it/size_config.dart';
import 'package:chat_it/utils/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  String phoneNo;
  OTPScreen(this.phoneNo);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  @override
  void initState() {
    verify(widget.phoneNo);
    super.initState();
  }


  final FirebaseAuth _auth = FirebaseAuth.instance;

  // for pin code input field.
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  String verificationCode;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(

      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  verify(String phoneNo) async{
    await  _auth.verifyPhoneNumber(
        phoneNumber: '+91-$phoneNo',
        verificationCompleted: (PhoneAuthCredential credential)async {
          _auth.signInWithCredential(credential)
              .then((value) async {
            if(value != null){
              print('it works good bro.');

            }

          }
          );
        },
        verificationFailed: (FirebaseAuthException e){
          print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!its not working bro.');
          print(e.message);
          print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!its not working bro.');
        },
        codeSent: (String verificationId, int resendToken) {
          setState(() {
            verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verificationCode = verificationId;
          });
        },
        timeout: Duration(seconds: 60)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verifying +91 ${widget.phoneNo}',
              style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.03),
            ),

            SizedBox(
              height: SizeConfig().heigth(context) * 0.07,
            ),

            Container(
              width: SizeConfig().width(context) * 0.9,
              child: PinPut(
                textStyle: textStyle,
                fieldsCount: 6,
                // onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                  ),
                ),
                onSubmit: (pin){
                  _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationCode, smsCode: pin)).then((value){
                    if(value != null){
                      print('user is logged in!!!!');
                      Navigator.pushReplacementNamed(context, HomeScreen.id);
                      setSignedIn(true);
                    }
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
