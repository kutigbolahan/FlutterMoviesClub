import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviesclub/screens/home/home.dart';
import 'package:moviesclub/screens/login/login.dart';

class GetScreenId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return HomeScreen();
        }else{
          return Login();
        }
      },
      
    );
  }
}




//  Widget getScreenId(){
//     return StreamBuilder<FirebaseUser>(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (context, snapshot){
//         if (snapshot.hasData) {
//           return HomeScreen();
//         }else{
//           return Login();
//         }
//       }
//       );
//   }