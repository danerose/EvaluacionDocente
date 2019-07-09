import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
// Import own files
import 'package:evaluacion_docente/src/components/index.dart' as components;

class LoadingPage extends StatefulWidget {
  @override
  State createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
      Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, 'home')
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          components.BackgroundImage(),
          _containerContent()
        ]
      )
    );
  }


_containerContent() {
  return Center(
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'load',
                  child: components.LogoUPQROO(1,200.0, 200.0),
                ),
                SizedBox(height: 20.0),
                components.TextContent('Sistema de Evaluación', 20.0,TextAlign.center, Colors.black,0.0, true),
              ],
          ),
        ),
        Expanded(
          child: Center(
            child: _progressBar(),
          )
        )
      ],
    )
  );
}

_progressBar() {
  return CircularProgressIndicator(
    backgroundColor: Colors.cyan,
    strokeWidth: 5.0,
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
  );
 } 

}