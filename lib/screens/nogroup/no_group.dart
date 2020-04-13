import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goToJoin() {}
    void _goToCreate() {}
    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(flex: 1),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset('assets/images/video1.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Welcome To The Movies Club.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Since you are not yet part of any group you can either join or create a group.',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                
                // fontSize: 15
              ),
            ),
          ),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    color: Theme.of(context).canvasColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 0.5)),
                    child: Text(
                      'Create',
                      style: GoogleFonts.montserrat(),
                    ),
                    onPressed: () {}),
                RaisedButton(
                    child: Text(
                      'Join',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                    onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
