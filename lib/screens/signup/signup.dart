import 'package:flutter/material.dart';
import 'package:moviesclub/screens/signup/localwidgets/signup_form.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              //flex: 1,
              child: ListView(
                padding: EdgeInsets.all(30),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                 MySignUpForm(),
                ],
              ))
        ],
      ),
    );
  }
}
