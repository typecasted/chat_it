
import 'package:chat_it/Componants/HomeScreenComponants/home_screen_appBar.dart';
import 'package:chat_it/Componants/HomeScreenComponants/home_screen_new_message_button.dart';
import 'package:chat_it/Componants/HomeScreenComponants/home_screen_searchbar.dart';
import 'package:chat_it/Componants/componants.dart';
import 'package:chat_it/size_config.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102535),
      floatingActionButton: NewMessage(),
      body: SafeArea(
          child: Column(
            children: [
              HomeScreenAppBar(),
              HomeScreenSearchBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: SizeConfig().width(context) * 0.08,
                            backgroundImage: AssetImage('image/myPic.jpeg'),
                          ),
                          title: Text(
                            'Kunal Pithadiya',
                            style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.027),
                          ),

                          subtitle: Text(
                            'Hello...',
                            style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.017),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}





