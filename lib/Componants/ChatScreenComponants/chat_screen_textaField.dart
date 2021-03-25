
import 'package:chat_it/Componants/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ChatScreenTextField extends StatelessWidget {
  const ChatScreenTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:SizeConfig().heigth(context) * 0.06,
      width: SizeConfig().width(context) * 0.7,

      child: Center(
        child: TextField(

          style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.02),

          decoration: InputDecoration(

            fillColor: Color(0xFF102535),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),

            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}