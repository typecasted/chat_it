

import 'package:shared_preferences/shared_preferences.dart';

setSignedIn(bool isSignedIn) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('IsSignedIn', isSignedIn);
}

setUserName(String userName) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('Username', userName);
}

setNumber(String number) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('number', number);
}

Future<bool> checkIsSignedIn() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isSignedIn = preferences.getBool('IsSignedIn') ?? false;
  return isSignedIn;
}

Future<String> getUserName() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String userName = preferences.getString('Username');
  return userName;
}

Future<String> getNumber() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String userName = preferences.getString('number');
  return userName;
}