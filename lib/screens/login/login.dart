import 'package:flutter/material.dart';
import 'package:moviesclub/screens/login/localwidgets/login_form.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
              child: ListView(
            padding: EdgeInsets.all(30),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset(
                  'assets/images/video2.png',
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LoginForm(),
            ],
          ))
        ],
      ),
    );
  }
}
