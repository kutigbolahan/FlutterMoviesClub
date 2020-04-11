import 'package:flutter/material.dart';

class MyTheme{
  Color _lightTheme = Color.fromRGBO(0, 109, 142, 0.2);
 // Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  //Color _darkGrey = Color.fromARGB(255, 119, 124, 135);
  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: _lightTheme,
      // primaryColor: _lightTheme,
      // accentColor: _lightGrey,
      // secondaryHeaderColor: _darkGrey
    );
  }
}
//0, 111, 166, 0.5