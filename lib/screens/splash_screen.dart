import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/getscreenid.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), ()=> Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context)=> GetScreenId())
    ));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(98.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(tag: 1,
             child: Image.asset(
                    'assets/images/video1.png',
                    height: 150,
                    width: 150,
                  ),
            
            ),
            SizedBox(height: 10,),
            Text('MOVIE CLUB',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w400
                ),)
          ],
        ),
      ),
    );
  }
}