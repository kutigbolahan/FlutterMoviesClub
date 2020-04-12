import 'package:flutter/material.dart';
import 'package:moviesclub/screens/login/login.dart';
import 'package:moviesclub/states/current_user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Home'),
        
      ),
      body:Center(
        child: RaisedButton(
          child: Text('Sign Out'),
          onPressed: ()async{
            CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
          String _returnString =await  _currentUser.signOut();
          if (_returnString == 'success') {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()) ,(route) => false);
          }
          }),
      ) ,
    );
  }
}