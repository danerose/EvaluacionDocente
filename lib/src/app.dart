import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Own Import
import 'package:evaluacion_docente/src/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.cyan, accentColor: Colors.white),
      initialRoute: '/',
      routes: getRoutes(),
    );
  }
}
