


import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_appBar.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_chatBox_panel.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_send_message_button.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_textaField.dart';
import 'package:chat_it/size_config.dart';
import 'package:flutter/cupertino.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatScreenAppBar(),


          Container(
            height: SizeConfig().heigth(context) * 0.2,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Color(0xEE203545),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatScreenTextField(),
                      SendMessageButton(),
                    ],
                  ),
                ChatBoxOptionsPanel()
              ],
            ),
          ),
        ],
      ),
    );

  }
}







