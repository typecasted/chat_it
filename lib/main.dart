import 'package:chat_it/screens/Chat_Screen.dart';
import 'package:chat_it/screens/Home_Screen.dart';
import 'package:chat_it/screens/SignIn_Screen.dart';
import 'package:chat_it/screens/SignUp_Screen.dart';
import 'package:chat_it/screens/create_new_message_screen.dart';
import 'package:chat_it/utils/shared_preferences.dart';
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

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoggedIn;
  @override
  void initState() {
    getLoggedInInfo();

    super.initState();
  }

  getLoggedInInfo() async{
    await checkIsSignedIn().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData (
        primarySwatch: Colors.blue,
      ),

      home: isLoggedIn != null ? isLoggedIn ? HomeScreen() : SignInScreen() : Container(color: Color(0xFF102535),),

      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        CreateNewMessageScreen.id : (context) => CreateNewMessageScreen(),
      },
    );
  }
}


