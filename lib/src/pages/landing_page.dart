import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Imports files del proyecto
import 'package:evaluacion_docente/src/components/index.dart' as components;

class LandingPage extends StatefulWidget {
  @override
  State createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // super.initState();
    // Future.delayed(const Duration(seconds: 3),
    //   () => Navigator.pushReplacementNamed(context, 'home')
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main.png'),
                fit: BoxFit.cover)
       ),
      ),
      _containerContent()
    ]));
  }

  _containerContent() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'load',
                child: Image(
                  width: 250.0,
                  height: 250.0,
                  image: AssetImage('assets/images/gif.gif'),
                )//components.LogoUPQROO(2, 250.0, 250.0),
              ),
              SizedBox(height: 20.0),
              components.TextContent('Sistema de Evaluación', 25.0,
                  TextAlign.center, Colors.white, 0.0, true),
            ],
          ),
        ),
      ],
    ));
  }
}
