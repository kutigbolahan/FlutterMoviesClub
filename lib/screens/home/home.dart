import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesclub/screens/login/login.dart';
import 'package:moviesclub/states/current_user.dart';
import 'package:moviesclub/widgets/my_container.dart';
import 'package:moviesclub/screens/nogroup/no_group.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  void _goToNoGroup(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyNoGroup()));
  }
  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == 'success') {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom:12.0),
          child: ListView(
      children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyContainer(
                  child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
          'Avengers: End Game',
          style: GoogleFonts.montserrat(
              fontSize: 18, 
              color: Colors.grey[600]),
                  ),
                  Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              Text(
                'Due In: ',
                style: GoogleFonts.montserrat(
                    //fontSize: 15,
                     color: Colors.grey[600]),
              ),
              Text('10 days',style: GoogleFonts.montserrat(
             // fontSize: 12,
              fontWeight: FontWeight.bold
            ),),
            ],
          ),
                  ),
                  RaisedButton(
          child: Text('Finished Movie', style: GoogleFonts.montserrat(
              
              color: Colors.white
            ),),
          onPressed: (){})
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyContainer(
                child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Next Movie Revealed In: ',
                style: GoogleFonts.montserrat(
                    //fontSize: 15,
                     color: Colors.grey[600]),
              ),
              Text('22 Hours',style: GoogleFonts.montserrat(
             // fontSize: 12,
              fontWeight: FontWeight.bold
            ),),
            ],
          ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40.0,
              vertical: 20
              ),
              child:
                  RaisedButton(child: Text('Book Club History',
                  style: GoogleFonts.montserrat(
          color: Colors.white
                  ),
                  ), onPressed: ()=>_goToNoGroup(context)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: RaisedButton(
                color: Theme.of(context).canvasColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
          color: Theme.of(context).secondaryHeaderColor,
          width: 1
                  )
                ),
                  child: Text('Sign Out'), onPressed: () => _signOut(context)),
            ),
      ],
    ),
        ));
  }
}
