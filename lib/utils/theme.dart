import 'package:flutter/material.dart';

class MyTheme{
  Color _lightTheme = Color.fromRGBO(0, 109, 142, 0.2);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkGrey = Color.fromARGB(255, 119, 124, 135);
  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: Colors.yellow[500],
      // primaryColor: _lightTheme,
       accentColor: _lightGrey,
       secondaryHeaderColor: _darkGrey,
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: _lightGrey
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: _lightTheme
          )
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _darkGrey,
        padding: EdgeInsets.symmetric(horizontal: 20),
        minWidth: 200,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          
        )
      )
    );
  }
}
//0, 111, 166, 0.5