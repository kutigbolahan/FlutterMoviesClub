import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/screens/home/home.dart';
import 'package:moviesclub/screens/signup/signup.dart';
import 'package:moviesclub/states/current_user.dart';

import 'package:moviesclub/widgets/my_container.dart';
import 'package:provider/provider.dart';

class MyLoginForm extends StatefulWidget {
  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.loginUserWithEmail(email, password);
      if (_returnString == 'success') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              'Login',
              style: GoogleFonts.montserrat(
                color: Colors.grey, // Color.fromRGBO(0, 109, 142, 0.2),
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'E-Mail'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    onPressed: () {
                      _loginUser(_emailController.text,
                          _passwordController.text, context);
                    }),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Don't have an account ? SIGN UP",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
