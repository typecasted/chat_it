

import 'package:shared_preferences/shared_preferences.dart';

setSignedIn(bool IsSignedIn) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('IsSignedIn', IsSignedIn);
}

setUserName(String userName) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('Username', userName);
}

setEmail(String email) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('email', email);
}

Future<bool> checkIsSignedIn() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool IsSignedIn = preferences.getBool('IsSignedIn') ?? false;
  return IsSignedIn;
}

Future<String> getUserName() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String userName = preferences.getString('Username');
  return userName;
}

Future<String> getEmail() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String userName = preferences.getString('email');
  return userName;
}