

import 'package:chat_it/size_config.dart';
import 'package:chat_it/utils/firestore_methods.dart';
import 'package:chat_it/utils/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../componants.dart';

class FindUserTextField extends StatefulWidget {

  @override
  _FindUserTextFieldState createState() => _FindUserTextFieldState();
}

class _FindUserTextFieldState extends State<FindUserTextField> {
  @override
  void initState() {
    getNumber().then((value){
      setState(() {
        number = value;
      });
    });
    super.initState();
  }

  String number;
  final TextEditingController _userName = TextEditingController();

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  FireStoreMethods methods = FireStoreMethods();
  QuerySnapshot snapshot;
  initiateSearch(userName){
    _fireStore.collection('users').where('username', isEqualTo: userName).get().then((value){
      setState(() {
        snapshot = value;
      });
    });

  }

  Widget searchList(BuildContext context){
    return snapshot != null ? ListView.builder(
        itemCount: snapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return snapshot.docs[index].data()['number'] != number ? SearchTile(
            userName: snapshot.docs[index].data()['username'],
            number: snapshot.docs[index].data()['number'],
          ): Container();
        }
    ) : Container(
      height: 100.0,
      width: 100.0,
      // color: Colors.red,
      child: Text(
        '^\nSearch here',
        style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.03),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: SizeConfig().heigth(context) * 0.01, horizontal: SizeConfig().width(context) * 0.03),
            child: Container(
              height: SizeConfig().heigth(context) * 0.08,
              child: TextField(

                controller: _userName,
                keyboardType: TextInputType.name,

                onChanged: (text){
                  initiateSearch(text);
                },
                style: TextStyle(
                    fontSize:SizeConfig().heigth(context) * 0.024,
                    color: Colors.white,
                    fontFamily: 'Schyler'
                ),
                decoration: InputDecoration(
                  hintText: 'Message to:',
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
                    padding: EdgeInsets.only(left: SizeConfig().width(context) * 0.05, right: SizeConfig().width(context) * 0.03),
                    child: Icon(
                          Icons.search_rounded,
                          size: SizeConfig().heigth(context) * 0.035,
                          color: Colors.white24,
                      ),
                  ),

                ),
              ),
            ),
          ),
          snapshot != null ? searchList(context):
          Container(
            child: Text(
              '^\nSearch here',
              style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.03),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {

  final String userName;
  final String number;

  SearchTile({this.userName, this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeConfig().heigth(context) * 0.01, horizontal: SizeConfig().width(context) * 0.05),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.035),
                ),
                Text(
                  number,
                  style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.022),
                ),
              ],
            ),
            Spacer(),

            Container(
              width: SizeConfig().width(context) * 0.25,
              height: SizeConfig().heigth(context) * 0.05,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Center(
                child: Text(
                  'Message',
                  style: textStyle.copyWith(fontSize: SizeConfig().heigth(context) * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
