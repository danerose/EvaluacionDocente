import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';


class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context)
    );
  }
}


_body(context) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      BackgroundImage(),
      _customScrollView(context)
    ]
  );
}
_customScrollView(context){
  return CustomScrollView(
    slivers: <Widget>[
      _sliverAppBar(),
      _sliverItems(context)
    ],
  );
}
_sliverAppBar(){
  return SliverAppBar(
    expandedHeight: 200.0,
    pinned: true,
    floating: true,
    flexibleSpace: FlexibleSpaceBar(
    centerTitle: true,
    title:TextContent('Usuarios',20.0,TextAlign.center,Colors.white,true),
    background: BackgroundBanner(),
   )
  );
}


_sliverItems(context){

  return SliverList(
    delegate: SliverChildListDelegate(
      <Widget>[
        Hero(
          tag: 'Alumno',
          child: Container(
          height: MediaQuery.of(context).size.height/3.5,
          child: HomeCardWidget(
            1,
            'Alumnos',
            'Evaluación Alumno - Docente',
            'Presiona para Iniciar Sesión',
          ),
         ),
        ),
        Hero(
          tag: 'Docente',
          child: Container(
          height: MediaQuery.of(context).size.height/3.5,
          child: HomeCardWidget(
            2,
            'Docentes',
            'Evaluación Docente - Docente',
            'Presiona para Iniciar Sesión',
          ),
         ),
        ),
        Hero(
          tag: 'Coordinador',
          child: Container(
          height: MediaQuery.of(context).size.height/3.5,
          child: HomeCardWidget(
            3,
            'Coordinador',
            'Evaluación Coordinador - Docente',
            'Presiona para Iniciar Sesión',
          ),
         ),
        ),
        Hero(
          tag: 'Administrador',
          child: Container(
          height: MediaQuery.of(context).size.height/3.5,
          child: HomeCardWidget(
            4,
            'Administrador',
            'Exclusivamente para el Administrador',
            'Presiona para Iniciar Sesión',
          ),
         ),
        ),
      ]
    ),
  );
}