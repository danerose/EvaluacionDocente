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
    snap: false,
    flexibleSpace: _flexibleSpace(),
  );
}

_flexibleSpace(){
  return FlexibleSpaceBar(
    centerTitle: true,
    title:TextContent('Evaluaciones',20.0,TextAlign.center,Colors.white,0.0,true),
    background: BackgroundBanner(),
  );
}

_sliverItems(context){

  return SliverList(
    delegate: SliverChildListDelegate(
      <Widget>[
        Hero(
          tag: 'Alumno',
          child: EvaluationCardWidget(
            'Carlos Martin Tamay Gomez',
            'Aplicaciones Moviles Avanzadas',
            'Hecho',
            'Presiona para Evaluar',
          ),
        ),
        Hero(
          tag: 'Docente',
          child: EvaluationCardWidget(
            'Moises Ortefa',
            'Sistemas Inteligentes',
            'Pendiente',
            'Presiona para Evaluar',
          ),
        ),
        Hero(
          tag: 'Administrador',
          child: EvaluationCardWidget(
            'Gino Madrazo',
            'Inteligencia Artificial',
            'Hecho',
            'Presiona para Evaluar',
          ),
        ),
        Hero(
          tag: 'Gerencia',
          child: EvaluationCardWidget(
            'Manuel Flores',
            'Seguridad Informatica',
            'Pendiente',
            'Presiona para Evaluar',
          ),
        ),
      ]
    ),
  );
 } 

}