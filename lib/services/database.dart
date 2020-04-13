import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesclub/models/user.dart';


//creating users as they sign up for the app
class MyDatabase{
  final Firestore _firestore = Firestore.instance;

  Future<String>createUser(MyUser user) async{
    String retVal = 'error';
try {
  await _firestore.collection('users').document(user.uid).setData({
    'fullName': user.fullName,
    'email': user.email,
    'accountCreated': Timestamp.now(),
  });
  retVal = 'success';
} catch (e) {
  print(e);
}
    return retVal;
  }

  Future<MyUser> getUserInfo(String uid) async{
    MyUser retVal = MyUser();
try {
  DocumentSnapshot _docSnapshot= await _firestore.collection('users').document(uid).get();
  retVal.uid = uid;
  retVal.fullName = _docSnapshot['fullName'];
  retVal.email = _docSnapshot['email'];
  retVal.accountCreted = _docSnapshot['accountCreted'];
  
  
} catch (e) {
  print(e);
}
    return retVal;
  }
}