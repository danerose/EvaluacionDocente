import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          components.BackgroundImage(),
          _customScrollView(context)])
    );
  }


_customScrollView(context) {
  return CustomScrollView(
    slivers: <Widget>[
      _sliverAppBar(),
      _sliverItems(context)
    ],
  );
}

_sliverAppBar() {
  return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      floating: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title:
            components.TextContent('Usuarios', 20.0, TextAlign.center, Colors.white,0.0,true),
        background: components.BackgroundBanner(),
      ));
}

_sliverItems(context) {
  return SliverList(
    delegate: SliverChildListDelegate(<Widget>[
      Hero(
        tag: 'alumno',
          child: components.HomeCardWidget(
            'Alumnos',
            'Evaluación Alumno - Docente',
            'Presiona para Iniciar Sesión',
            'alumno'
          ),
      ),
      Hero(
        tag: 'docente',
          child: components.HomeCardWidget(
            'Docentes',
            'Evaluación Docente - Docente',
            'Presiona para Iniciar Sesión',
            'docente'
          ),
      ),
      Hero(
        tag: 'aministrador',
          child: components.HomeCardWidget(
            'Administrador',
            'Exclusivamente para el Administrador',
            'Presiona para Iniciar Sesión',
            'aministrador'
          ),
      ),
    ]
   ),
  );
 }


}