import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviesclub/screens/home/home.dart';
import 'package:moviesclub/screens/login/login.dart';

import 'package:moviesclub/screens/splash_screen.dart';
import 'package:moviesclub/states/current_user.dart';
import 'package:moviesclub/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget _getScreenId(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return HomeScreen();
        }else{
          return Login();
        }
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentUser())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme().buildTheme(),
        home: _getScreenId(),
      ),
    );
  }
}
