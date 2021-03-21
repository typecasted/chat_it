import 'package:chat_it/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizeConfig sizeConfig = SizeConfig();

TextStyle textStyle =  TextStyle(
    color: Colors.white,
    fontFamily: 'Schyler'
);

LinearGradient SignInButtonGradient = LinearGradient(
  colors: [
    Colors.deepPurpleAccent.shade200,
    Colors.blueAccent.shade200,
    Colors.blue,
  ],
);

LinearGradient SignUpButtonGradient = LinearGradient(
  colors: [
    Colors.blue,
    Colors.blueAccent.shade200,
    Colors.deepPurpleAccent.shade200,
  ],
);