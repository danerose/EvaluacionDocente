import 'dart:async';
import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

// Imports files del proyecto
import 'package:evaluacion_docente/src/components/index.dart' as components;

class LoadingPage extends StatefulWidget {
  @override
  State createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'home')
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.data(context);
    bloc.loadPeriod();
    bloc.changeLoad(false);
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      components.BackgroundImage(),
      _containerContent()
    ]));
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
                child: components.LogoUPQROO(1, 200.0, 200.0),
              ),
              SizedBox(height: 20.0),
              components.TextContent('Sistema de Evaluación', 25.0,TextAlign.center, Colors.black, 0.0, true),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
               child: _progressBar(),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10.0),
                child: components.TextContent('Verificando Conexión...',18.0,TextAlign.center,Colors.black,3.0,false),
              )
            ],
          ),
        )
      ],
    ));
  }

  _progressBar() {
    return SizedBox(
      child: CircularProgressIndicator(
        backgroundColor: Colors.cyan,
        strokeWidth: 5.0,
      ),
      height: 80.0,
      width: 80.0,
    );
  }
}
