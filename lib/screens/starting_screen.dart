

import 'package:chat_it/screens/Chat_Screen.dart';
import 'package:chat_it/screens/SignIn_Screen.dart';
import 'package:chat_it/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

Future<Widget> startingScreen() async{
  bool _isSignedIn = await checkIsSignedIn();
  if(_isSignedIn){
    return ChatScreen();
  } else{
    return SignInScreen();
  }
}
















// import 'package:chat_it/Componants/Sign_In_Up_Componants/SignIn_Up%20Button.dart';
// import 'package:chat_it/Componants/componants.dart';
// import 'package:chat_it/screens/SignIn_Screen.dart';
// import 'package:chat_it/screens/SignUp_Screen.dart';
// import 'package:chat_it/size_config.dart';
// import 'package:flutter/material.dart';
//
// class StartingScreen extends StatefulWidget {
//   @override
//   _StartingScreenState createState() => _StartingScreenState();
// }
//
// class _StartingScreenState extends State<StartingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF102535),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Text(
//               'Chat !t',
//               style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.07),
//             ),
//           ),
//
//           SizedBox(
//             height: SizeConfig().heigth(context) * 0.04,
//           ),
//           SignInButton(
//             onTap: (){
//               Navigator.pushNamed(context, SignInScreen.id);
//             },
//             gradient: SignInButtonGradient,
//             child: Center(
//               child: Text(
//                 "Sign In",
//                 style: textStyle.copyWith(
//                     fontSize: SizeConfig().heigth(context) * 0.035,
//                     letterSpacing: SizeConfig().width(context) * 0.001
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: SizeConfig().heigth(context) * 0.02,
//           ),
//           SignInButton(
//             onTap: (){
//               Navigator.pushNamed(context, SignUpScreen.id);
//             },
//             gradient: SignUpButtonGradient,
//             child: Center(
//               child: Text(
//                 "Sign Up",
//                 style: textStyle.copyWith(
//                     fontSize: SizeConfig().heigth(context) * 0.035,
//                     letterSpacing: SizeConfig().width(context) * 0.001
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


