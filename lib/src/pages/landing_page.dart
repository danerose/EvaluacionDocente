import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Imports files del proyecto
import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
import 'package:evaluacion_docente/src/components/index.dart' as components;

class LandingPage extends StatefulWidget {
  @override
  State createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  bool fade = true;
  bool conexion = false;
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
        
        Future.delayed(Duration(seconds: 1),
          () => setState ((){
             _image = AssetImage('assets/images/load.gif');
          })
        ); 
        Future.delayed(Duration(seconds: 3),
          () => setState((){
            if(conexion){
               Navigator.pushReplacementNamed(context, 'home');
             }else{
               this._alert(context);
             }
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
    bloc.changePassword('000');
    bloc.validateConexion().then((res) => conexion = res);
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

  _alert(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Fallo en la conexion'),
            content: Text('Por favor verifica tu conexion a internet'),
            actions: <Widget>[
              FlatButton(
                child: Text('Reiniciar'),
                textColor: Colors.blue,
                onPressed:()=> Navigator.pushNamedAndRemoveUntil(context, '/',
                            (Route<dynamic> route) => false),
              )
            ],
          );
        });
  }
}
