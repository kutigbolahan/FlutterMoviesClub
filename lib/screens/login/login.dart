import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/screens/login/localwidgets/login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              // flex: 1,
              child: ListView(
            padding: EdgeInsets.all(30),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Hero(
                  tag: 1,
                                  child: Image.asset(
                    'assets/images/video1.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Center(
                child: Text('Movie Club',
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  //fontWeight: FontWeight.w400
                ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyLoginForm(),
            ],
          ))
        ],
      ),
    );
  }
}
