import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesclub/models/user.dart';
import 'package:moviesclub/models/group.dart';
import 'package:moviesclub/models/movie.dart';
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


   Future<MyGroup> getGroupInfo(String groupId) async {
    MyGroup retVal = MyGroup();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection('groups').document(groupId).get();
      retVal.id = groupId;
      retVal.name = _docSnapshot.data['name'];
      retVal.leader = _docSnapshot.data['leader'];
      retVal.members = List<String>.from( _docSnapshot.data['members']);
      retVal.groupCreated = _docSnapshot.data['groupCreated'];
      retVal.currentMovieId = _docSnapshot.data['currentMovieId'];
      retVal.currentMovieDue = _docSnapshot.data['currentMovieDue'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
   Future<MyMovie> getCurrentMovie(String groupId, String movieId) async {
    MyMovie retVal = MyMovie();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection('groups').document(groupId).collection('movies').document('bookId').get();
      retVal.id = movieId;
      retVal.name = _docSnapshot.data['name'];
      retVal.length = _docSnapshot.data['length'];
     
      retVal.dateCompleted = _docSnapshot.data['dateCompleted'];
     
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
