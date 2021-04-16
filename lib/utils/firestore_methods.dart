import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreMethods {

  // FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  uploadUserNameAndEmailToFireStore(userInfoMap) async{
    _fireStore.collection('users').add(userInfoMap);
  }

}