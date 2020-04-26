import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviesclub/models/user.dart';
import 'package:moviesclub/services/database.dart';

class CurrentUser extends ChangeNotifier {
  MyUser _currentUser = MyUser();

//accessors for the _uid and _email
  MyUser get getCurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(
      String email, String password, String fullName) async {
    String retVal = 'error';
    MyUser _user = MyUser();
    try {
      AuthResult _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _user.uid = _authResult.user.uid;
      _user.email = _authResult.user.email;
      _user.fullName = fullName;
      String _returnString = await MyDatabase().createUser(_user);
      if (_returnString == 'success') {
        retVal = 'success';
      }
    } catch (e) {
      print(e);
      retVal = e.message;
    }
    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = 'error';
    try {
      AuthResult _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _currentUser = await MyDatabase().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retVal = 'success';
      }
    }  catch (e) {
      retVal = e.message;
      print(e);
    }
    return retVal;
  }

  Future<String> loginGoogle() async {
    String retVal = 'error';
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ]);
    MyUser _user = MyUser();
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);

      AuthResult _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        _user.uid = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.fullName = _authResult.user.displayName;
        MyDatabase().createUser(_user);
      }
      _currentUser = await MyDatabase().getUserInfo(_authResult.user.uid);
      if (_currentUser != null) {
        retVal = 'success';
      }
    } catch (e) {
      retVal = e.message;
      print(e);
    }
    return retVal;
  }

  Future<String> signOut() async {
    String retVal = 'error';
    try {
      await _auth.signOut();
      _currentUser = MyUser();
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
