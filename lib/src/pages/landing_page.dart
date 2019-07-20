import 'dart:async';
import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
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

class LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool fade = true;
  var  _image = AssetImage('assets/images/logo_white.png');
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn
    );
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed && fade == true) {
         Future.delayed(Duration(seconds: 2),
          () => setState ((){
             _image = AssetImage('assets/images/load.gif');
            Future.delayed(const Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(context, 'home')
            );
          })
        ); 
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.data(context);
    bloc.loadPeriod();
    bloc.changeLoad(false);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/main.png'),
              fit: BoxFit.cover)
            ),
          ),
          _containerContent()
        ]
      )
    );
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
              Container(
                child: FadeTransition(
                  opacity: animation,
                  child: Hero(
                    tag: 'load',
                    child: Image(
                      width: 250.0,
                      height: 250.0,
                      image:_image,
                      gaplessPlayback:true
                    ),
                  ),
                ),
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
