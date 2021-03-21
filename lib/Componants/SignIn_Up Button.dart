import 'package:chat_it/size_config.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {

  final child;
  final Gradient gradient;
  final Function onTap;
  SignInButton({this.child, this.gradient, this.onTap});
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig().heigth(context) * 0.08,
        width: SizeConfig().width(context) * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Color(0x000000)),
          gradient: gradient,
        ),
        child: child,
      ),
    );
  }

}