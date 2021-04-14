import 'package:chat_it/screens/create_new_message_screen.dart';
import 'package:chat_it/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeConfig().heigth(context) * 0.02, right: SizeConfig().width(context) * 0.03),
      child: SizedBox(
        height: SizeConfig().heigth(context) * 0.09,
        width: SizeConfig().heigth(context) * 0.09,
        // new message floating button
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, CreateNewMessageScreen.id);
          },
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.add,
            size: SizeConfig().heigth(context) * 0.04,
          ),
        ),
      ),
    );
  }
}

