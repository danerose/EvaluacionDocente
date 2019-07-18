import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
import 'package:evaluacion_docente/src/components/index.dart' as components;

class EvaluationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  _body(context) {
    final bloc = ProviderBloc.data(context);
    return Stack(fit: StackFit.expand, children: <Widget>[
      components.BackgroundImage(),
      _customScrollView(context, bloc)
    ]);
  }

  _customScrollView(context, DataBloc bloc) {
    return CustomScrollView(
      slivers: <Widget>[_sliverAppBar(), _sliverItems(context, bloc)],
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      floating: true,
      snap: false,
      flexibleSpace: _flexibleSpace(),
    );
  }

  _flexibleSpace() {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: components.TextContent(
          'Evaluaciones', 20.0, TextAlign.center, Colors.white, 0.0, true),
      background: components.BackgroundBanner(),
    );
  }

  Widget _sliverItems(BuildContext context, DataBloc bloc) {
    return StreamBuilder(
        stream: bloc.profesorsStream,
        builder: (BuildContext context, snapshot) => SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Hero(
                        tag: index,
                        child: components.EvaluationCardWidget(
                          bloc.profesors[index].docente,
                          bloc.profesors[index].matnom,
                          bloc.profesors[index].realizado,
                          'Presiona para Evaluar',
                        ),
                      ),
                  childCount: snapshot.hasData ? bloc.profesors.length : 0),
        )
    );
  }
}
