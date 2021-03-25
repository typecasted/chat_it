


import 'package:chat_it/size_config.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),

      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: SizeConfig().heigth(context) * 0.1,
              width: double.infinity,
            ),
          ),
          
          Container(
            height: SizeConfig().heigth(context) * 0.07,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
    );

  }
}
