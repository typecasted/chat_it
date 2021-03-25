
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../componants.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig().width(context) * 0.045, vertical: SizeConfig().heigth(context) * 0.01),
      child: Row(
        children: [
          Text(
            'Chat !t',
            style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.055),
          ),

          Spacer(),

          CircleAvatar(
            backgroundColor: Colors.white,
            radius: SizeConfig().width(context) * 0.07,
            backgroundImage: AssetImage('image/myPic.jpeg'),

          ),
        ],
      ),
    );
  }
}