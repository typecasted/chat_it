
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class HomeScreenSearchBox extends StatelessWidget {
  const HomeScreenSearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig().heigth(context) * 0.01, horizontal: SizeConfig().width(context) * 0.03),
      child: Container(
        height: SizeConfig().heigth(context) * 0.07,
        child: TextField(
          style: TextStyle(
              fontSize:SizeConfig().heigth(context) * 0.024,
              color: Colors.white,
              fontFamily: 'Schyler'
          ),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
                fontSize: SizeConfig().heigth(context) * 0.024,
                color: Colors.white24,
                fontFamily: 'Schyler'
            ),
            filled: true,
            fillColor: Color(0xEE203146),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x000000)),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x000000)),
              borderRadius: BorderRadius.circular(50.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x000000)),
              borderRadius: BorderRadius.circular(50.0),
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: SizeConfig().width(context) * 0.05, right: SizeConfig().width(context) * 0.02),
              child: Icon(Icons.search_rounded, size: SizeConfig().heigth(context) * 0.035, color: Colors.white24,),
            ),

          ),
        ),
      ),
    );
  }
}