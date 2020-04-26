import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moviesclub/screens/home/home.dart';
import 'package:moviesclub/services/database.dart';
import 'package:moviesclub/states/current_user.dart';
import 'package:moviesclub/widgets/my_container.dart';
import 'package:provider/provider.dart';

class MyJoinGroup extends StatefulWidget {
  @override
  _MyJoinGroupState createState() => _MyJoinGroupState();
}

class _MyJoinGroupState extends State<MyJoinGroup> {
  
  void _joinGroup(BuildContext context,String groupId)async{
    try {
       CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
   String _returnString = await MyDatabase().joinGroup(groupId, _currentUser.getCurrentUser.uid);
  if (_returnString == 'success') {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
  }else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 4),
        ));
      }
    } catch (e) {
      print(e);
    return  e.message;
    }
    
 
  }
  TextEditingController _groupIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MyContainer(
              child: Column(
                
                children: <Widget>[
                  TextFormField(
                    controller: _groupIdController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.group), hintText: 'Group Name'),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      child: Text(
                        'Join',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () =>_joinGroup(context,_groupIdController.text))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
