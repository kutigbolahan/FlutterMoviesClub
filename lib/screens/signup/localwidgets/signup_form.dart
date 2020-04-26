import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/screens/login/login.dart';
import 'package:moviesclub/states/current_user.dart';

import 'package:moviesclub/widgets/my_container.dart';
import 'package:provider/provider.dart';

class MySignUpForm extends StatefulWidget {
  @override
  _MySignUpFormState createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
//   showAlertDialog(BuildContext context){
//   AlertDialog alert=AlertDialog(
//     content: new Row(
//         children: [
//            CircularProgressIndicator(),
//            Container(margin: EdgeInsets.only(left: 5),child:Text("Loading" )),
//         ],),
//   );
//   showDialog(
//     context:context,
//     builder:(BuildContext context){
//       return alert;
//     },
//   );
// }
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
 String _error;
  // bool validate() {
  //   final form = _formKey.currentState;
  //   form.save();
  //   if (form.validate()) {
  //     form.save();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
         CurrentUser _currentUser =
            Provider.of<CurrentUser>(context, listen: false);
     
      try {
       
        // showAlertDialog(context);
        String _returnString =
            await _currentUser.signUpUser(email, password, fullName);
        if (_returnString == 'success') {
          // Scaffold.of(context).showSnackBar(SnackBar
          //               (content:
          //               Text('Registeration successful') ,
          //               duration: Duration(seconds:9),
          //               ));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
         }
        else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(_returnString),
            duration: Duration(seconds: 4),
          ));
        }
      } catch (e) {
        print(e);
//  setState(() {
//    _error = e.message;
//  });
       return e.message;
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
              'Sign Up',
              style: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          showAlert(),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                
                TextFormField(
                 autovalidate: true,
                  validator: NameValidator.validate,
                  controller: _fullNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person), hintText: 'Full Name'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                   autovalidate: true,
                  validator: EmailValidator.validate,
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'E-Mail'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: PasswordValidator.validate,
                   autovalidate: true,
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
                TextFormField(
                  
                  controller: _confirmpasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_open),
                      hintText: 'Confirm Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                    ),
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmpasswordController.text) {
                        _signUpUser(
                            _emailController.text,
                            _passwordController.text,
                            context,
                            _fullNameController.text);
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Passwords do not match'),
                          duration: Duration(seconds: 2),
                        ));

                        // showDialog(
                        //   context:context ,
                        //   builder: (context){

                        //     return Dialog(
                        //       child: Column(
                        //         mainAxisSize: MainAxisSize.min,
                        //         children: <Widget>[
                        //           CircularProgressIndicator(),
                        //           Text('Registering')
                        //         ],
                        //       ),

                        //     );

                        //   }

                        //   );
                      }
                    }),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Already have an account ? Login",
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

   Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

}
