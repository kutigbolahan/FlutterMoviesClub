import 'package:flutter/material.dart';
import 'package:moviesclub/screens/home/home.dart';
import 'package:moviesclub/screens/login/login.dart';


enum AuthStatus{
  notLoggedIn,
  loggedIn
}
class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus =AuthStatus.notLoggedIn;

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}