
import 'package:flutter/cupertino.dart';

class SizeConfig{

  heigth(BuildContext context){
    final heigth = MediaQuery.of(context).size.height;
    return heigth;
  }
  width(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return width;
  }
}