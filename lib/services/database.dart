import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesclub/models/user.dart';

//creating users as they sign up for the app
class MyDatabase {
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(MyUser user) async {
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

  Future<MyUser> getUserInfo(String uid) async {
    MyUser retVal = MyUser();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection('users').document(uid).get();
      retVal.uid = uid;
      retVal.fullName = _docSnapshot.data['fullName'];
      retVal.email = _docSnapshot.data['email'];
      retVal.accountCreted = _docSnapshot.data['accountCreted'];
      retVal.groupId = _docSnapshot.data['groupId'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

   Future<String> createGroup(String groupName,String userUid) async {
    String retVal = 'error';
    List<String> members =List();
    try {
      members.add(userUid);
   DocumentReference _docRef =  await _firestore.collection('groups').add({
         'name' : groupName,
         'leader': userUid,
         'members': members,
         'groupCreate': Timestamp.now(),
     });
     await _firestore.collection('users').document(userUid).updateData({
'groupId': _docRef.documentID
     });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

   Future<String> joinGroup(String groupId,String userUid) async {
    String retVal = 'error';
    List<String> members = List();
    try {
      members.add(userUid);
      await _firestore.collection('groups').document(groupId).updateData({
  'members' : FieldValue.arrayUnion(members),
      });
        await _firestore.collection('users').document(userUid).updateData({
'groupId': groupId
     });
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
