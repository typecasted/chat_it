import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMethods {

  // FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  uploadUserNameAndEmailToFireStore(userInfoMap) async{
    _firestore.collection('users').add(userInfoMap);
  }

}