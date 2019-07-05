import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';

class EvaluationListPage extends StatelessWidget {
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
    flexibleSpace: _flexibleSpace(),
  );
}

_flexibleSpace(){
  return FlexibleSpaceBar(
    centerTitle: true,
    title:TextContent('Evaluaciones',20.0,TextAlign.center,Colors.white,true),
    background: BackgroundBanner(),
  );
}

_sliverItems(context){

  return SliverList(
    delegate: SliverChildListDelegate(
      <Widget>[
        Hero(
          tag: 'Alumno',
          child: Container(
          height: MediaQuery.of(context).size.height/4,
          child: TestCardWidget(
            'Carlos Martin Tamay Gomez',
            'Aplicaciones Moviles Avanzadas',
            'Hecho',
            'Presiona para Evaluar',
          ),
         ),
        ),
        Hero(
          tag: 'Docente',
          child: Container(
          height: MediaQuery.of(context).size.height/4,
          child: TestCardWidget(
            'Moises Ortefa',
            'Sistemas Inteligentes',
            'Pendiente',
            'Presiona para Evaluar',
          ),
         ),
        ),
        Hero(
          tag: 'Administrador',
          child: Container(
          height: MediaQuery.of(context).size.height/4,
          child: TestCardWidget(
            'Gino Madrazo',
            'Inteligencia Artificial',
            'Hecho',
            'Presiona para Evaluar',
          ),
         ),
        ),
        Hero(
          tag: 'Gerencia',
          child: Container(
          height: MediaQuery.of(context).size.height/4,
          child: TestCardWidget(
            'Manuel Flores',
            'Seguridad Informatica',
            'Pendiente',
            'Presiona para Evaluar',
          ),
         ),
        ),
      ]
    ),
  );
}