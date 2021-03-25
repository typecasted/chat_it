

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../componants.dart';

class ChatScreenAppBar extends StatelessWidget {
  const ChatScreenAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: SizeConfig().heigth(context) * 0.1,
        width: double.infinity,

        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: (){

                }),

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: SizeConfig().width(context) * 0.07,
              backgroundImage: AssetImage('image/myPic.jpeg'),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig().heigth(context) * 0.025, horizontal: SizeConfig().width(context) * 0.03),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Kunal Pithadiya',
                    style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.025),
                  ),

                  Text(
                    'Online',
                    style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.015),
                  ),
                ],
              ),
            ),

            Spacer(),
            IconButton(
                icon: Icon(Icons.more_horiz_rounded),
                color: Colors.white,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onPressed: (){
                })
          ],
        ),
      ),
    );
  }
}