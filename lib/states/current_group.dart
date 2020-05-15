import 'package:flutter/foundation.dart';
import 'package:moviesclub/models/group.dart';
import 'package:moviesclub/models/movie.dart';
import 'package:moviesclub/services/database.dart';


class CurrentGroup extends ChangeNotifier{
  MyGroup _currentGroup = MyGroup();
  MyMovie _currentMovie =MyMovie();

  MyGroup get getCurrentGroup => _currentGroup;
  MyMovie get getCurrentMovie => _currentMovie;

  void updateStateFromDatabase(String groupId)async{
     try {
       //get group info from firebase
       _currentGroup = await MyDatabase().getGroupInfo(groupId);
      //get current book info from firebase
       _currentMovie = await  MyDatabase().getCurrentMovie(groupId, _currentGroup.currentMovieId);
       notifyListeners();
     } catch (e) {
       print(e);
     }
  }
}

