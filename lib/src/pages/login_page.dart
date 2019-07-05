import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';
import 'package:evaluacion_docente/src/components/components/login_submit.dart';

class LoginPage extends StatelessWidget {
  final roll;
  LoginPage(this.roll);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(_formKey, roll),
    );
  }
}

_body(_formKey, user) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Hero(
        tag: user,
        child: Container(
          color: Color.fromRGBO(33, 182, 198, 0.5),
        ),
      ),
      new BackgroundImage(),
      CustomScrollView(
        slivers: <Widget>[_sliverAppBar(user), _sliverFillRemaining(_formKey)],
      )
    ],
  );
}

_sliverAppBar(user) {
  return SliverAppBar(
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: _flexibleSpaceBar(18.0, user));
}

_flexibleSpaceBar(size, user) {
  return FlexibleSpaceBar(
    title:
        TextContent('Login ' + user, size, TextAlign.end, Colors.white, true),
    background: BackgroundBanner(),
  );
}

_sliverFillRemaining(_formKey) {
  return SliverFillRemaining(
    child: Center(
      child: _containerContent(_formKey),
    ),
  );
}

_containerContent(_formKey) {
  return Center(
    child: SingleChildScrollView(
      padding: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextContent(
              'Iniciar Sesión', 30.0, TextAlign.center, Colors.black, false),
          SizedBox(height: 40.0),
          _formLoginSchool(_formKey)
        ],
      ),
    ),
  );
}

//Formulario del Login
_formLoginSchool(_formKey) {
  return Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginInput('Ingresa tu matricula', false),
        SizedBox(height: 30.0),
        LoginInput('Ingresa tu Contraseña', true),
        SizedBox(height: 30.0),
        LoginSubmit(_formKey)
      ],
    ),
  );
}
