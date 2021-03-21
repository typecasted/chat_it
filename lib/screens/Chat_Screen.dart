

import 'package:chat_it/Componants/componants.dart';
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

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade200,
        title: Text(
          'Kunal Pithadiya',
          style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.03),
        ),
      ),
    );
  }
}
