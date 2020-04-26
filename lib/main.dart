


import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:moviesclub/screens/splash_screen.dart';
import 'package:moviesclub/states/current_user.dart';
import 'package:moviesclub/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(),
    //DevicePreview(
    //builder: (context)=>MyApp(),
    //enabled: !kReleaseMode,
   // )
    );
}



class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentUser())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme().buildTheme(),
        home: SplashScreen(),
      ),
    );
  }
}
