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
} catch (e) {
  print(e);
}
    return retVal;
  }
}