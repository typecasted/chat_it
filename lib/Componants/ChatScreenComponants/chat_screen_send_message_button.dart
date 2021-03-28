import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height : SizeConfig().heigth(context) * 0.07,
      width : SizeConfig().heigth(context) * 0.07,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Colors.blueAccent.shade200,
            Colors.deepPurpleAccent.shade200,
          ],),
        borderRadius: BorderRadius.circular(30.0),
      ),

      child: IconButton(
          icon: Icon(Icons.send),
          color: Colors.white,
          iconSize: SizeConfig().heigth(context) * 0.03,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: (){

          }),

    );
  }
}
