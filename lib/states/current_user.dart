import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;
//accessors for the _uid and _email
  String get getUid => _uid;
  String get getEmail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password) async {
    String retVal = 'error';
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      retVal = 'success';
    } catch (e) {
      retVal = e.mesage;
    }
    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = 'error';
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
     
        _uid = _authResult.user.uid;
        _email = _authResult.user.email;
        retVal = 'success';
      
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }
}
