import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';
import 'package:evaluacion_docente/src/components/components/login_submit.dart';

class LoginStudentPage extends StatefulWidget{
  @override
  State createState() => LoginStudentState();
}

class LoginStudentState extends State<LoginStudentPage>{
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(_formKey,context),
    );
  }
}

_body(_formKey,context){
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Hero(
        tag: 'Alumno',
        child: Container(
          color:Color.fromRGBO(33, 182, 198, 0.5),
        ),
      ),
      BackgroundImage(),
      CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(context),
          _sliverFillRemaining(_formKey)
        ],
      )
    ],
  );
}

_sliverAppBar(context){
  return SliverAppBar(  
    expandedHeight: 200,
    floating: true,
    pinned: true,
    snap: true,
    flexibleSpace:_flexibleSpaceBar(18.0)
  );
}

_flexibleSpaceBar(size){
  return FlexibleSpaceBar(
    title: TextContent('Login Alumnos',size,TextAlign.center,Colors.white,true),
    background: BackgroundBanner(),
  );
}

_sliverFillRemaining(_formKey){
  return SliverFillRemaining(
    child: Center(
      child: _containerContent(_formKey),
    ),
  );
}
_containerContent(_formKey){
  return Center(
    child: SingleChildScrollView(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextContent('Iniciar Sesión', 30.0,TextAlign.center,Colors.black,false),
            SizedBox(height: 60.0),
            _formLogin(_formKey)
          ],
        ),
    ),
  );
}


//Formulario del Login
_formLogin(_formKey){
return Form(
    key: _formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginInput('Ingresa tu matricula',false),
        SizedBox(height: 30.0),
        SizedBox(height: 30.0),
        LoginSubmit(_formKey)
      ],
    ),
  );
}
