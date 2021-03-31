import 'package:chat_it/screens/Chat_Screen.dart';
import 'package:chat_it/screens/Home_Screen.dart';
import 'package:chat_it/screens/SignIn_Screen.dart';
import 'package:chat_it/screens/SignUp_Screen.dart';
import 'package:chat_it/screens/starting_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp]
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartingScreen(),

      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}


