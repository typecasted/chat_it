
import 'package:chat_it/Componants/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../size_config.dart';


class ChatScreenTextField extends StatelessWidget {
  const ChatScreenTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Container(

        // padding: EdgeInsets.symmetric(vertical: 200.0),
        height: SizeConfig().heigth(context) * 0.09,
        width: SizeConfig().width(context) * 0.7,
        child: TextField(

          style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.02),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: null,
          decoration: InputDecoration(
            fillColor: Color(0xFF102535),
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.transparent)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.transparent)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: Colors.transparent)
            ),
          ),


        ),
      ),
    );
  }
}