import 'package:flutter/material.dart';
import 'package:moviesclub/screens/login/login.dart';
import 'package:moviesclub/utils/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme().buildTheme(),
      home: Login(),
    );
  }
}
