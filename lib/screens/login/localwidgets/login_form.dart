import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/screens/signup/signup.dart';


import 'package:moviesclub/widgets/my_container.dart';

class MyLoginForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
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
                color:Colors.grey,// Color.fromRGBO(0, 109, 142, 0.2),
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
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'E-Mail'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
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
                    onPressed: () {}),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> SignUp())
                        );
                      }, 
                    child: Text("Don't have an account ? SIGN UP", style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),),
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
