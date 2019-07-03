import 'package:flutter/material.dart';

//Own Import
import 'package:evaluacion_docente/src/pages/landing_page.dart';
import 'package:flutter/services.dart';
class MyApp extends StatelessWidget {
  
  @override

  Widget build( context ){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
        accentColor: Colors.white
      ),
      home: LandingPage(),
     
    );
  }

}
