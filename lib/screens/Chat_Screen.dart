


import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_appBar.dart';
import 'file:///C:/Users/Lenovo/AndroidStudioProjects/chat_it/lib/Componants/ChatScreenComponants/chat_screen_send_message_button.dart';
import 'package:chat_it/Componants/ChatScreenComponants/chat_screen_chatBox_panel.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  bool _showBottomPanel = false;
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
            // height: SizeConfig().heigth(context) * 0.2,
            width: double.infinity,

            decoration: BoxDecoration(
              color: Color(0xEE203545),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig().heigth(context) * 0.01),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap : (){
                          setState(() {
                            if(widget._showBottomPanel == true){
                              widget._showBottomPanel = false;
                            } else {
                              widget._showBottomPanel = true;
                            }
                          });
                        },
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                          size: SizeConfig().heigth(context) * 0.03,
                        ),
                      ),

                      Container(

                        width: SizeConfig().width(context) * 0.7,
                        constraints: BoxConstraints(
                          maxHeight: SizeConfig().heigth(context) * 0.2,
                          minHeight: SizeConfig().heigth(context) * 0.01,
                        ),

                        child: TextField(
                          autocorrect: true,
                          style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.02),
                          minLines: null,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          // expands: true,

                          decoration: InputDecoration(
                            fillColor: Color(0xFF102535),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                      SendMessageButton(),

                    ],
                  ),
                  widget._showBottomPanel ? ChatBoxOptionsPanel() : Container(),
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
}







