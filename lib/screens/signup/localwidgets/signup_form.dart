import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController =TextEditingController();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();
  TextEditingController _confirmpasswordController =TextEditingController();

void _signUpUser(String email, String password, BuildContext context, String fullName)async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =await _currentUser.signUpUser(email, password,fullName);
      if(_returnString =='success'){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      }else{
        Scaffold.of(context).showSnackBar(SnackBar
                        (content:
                        Text('registeration UnSuccessful') ,
                        duration: Duration(seconds:2),
                        ));
      }
    } catch (e) {
      print(e);
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
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                 validator: (value)=> value.isEmpty  ?'Please add a name': '',
                  controller: _fullNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Full Name'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value)=> !value.contains('@') ?'Please enter an email ':'',
                  controller: _emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'E-Mail'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value){
                             if (value.length <6) {
                             return 'password must me more than 6';
                             }
                             return 'password must me more than 6';
                  },
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
                      if(_passwordController.text == _confirmpasswordController.text){
                        _signUpUser(_emailController.text,_passwordController.text, context, _fullNameController.text);
                      }else{
                        Scaffold.of(context).showSnackBar(SnackBar
                        (content:
                        Text('Passwords do not match') ,
                        duration: Duration(seconds:2),
                        ));
                      }
                    }),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> Login())
                        );
                      }, 
                    child: Text("Already have an account ? Login", style: GoogleFonts.montserrat(
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
