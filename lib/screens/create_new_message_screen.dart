import 'package:chat_it/Componants/CreatenewMessageScreenComponants/find_user_text_field.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewMessageScreen extends StatefulWidget {
  static String id = 'create_new_message_screen';
  @override
  _CreateNewMessageScreenState createState() => _CreateNewMessageScreenState();
}

class _CreateNewMessageScreenState extends State<CreateNewMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                children: [

                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      // highlightColor: Colors.transparent,
                      // focusColor: Colors.transparent,
                      // splashColor: Colors.transparent,
                      // hoverColor: Colors.transparent,
                      onPressed: (){
                        Navigator.pop(context);
                      }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig().heigth(context) * 0.02, horizontal: SizeConfig().width(context) * 0.02),
                    child: Text(
                      'New Message',
                      style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.04),
                    ),
                  ),
                ],
              ),
            ),
            FindUserTextField(),
          ],
        ),
      ),
    );
  }
}


