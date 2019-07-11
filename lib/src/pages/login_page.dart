
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;
// import 'package:evaluacion_docente/src/pages/main_page.dart';
import 'package:evaluacion_docente/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    final bloc = Provider.login(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: 'User',
          child: Container(
            color: Color.fromRGBO(33, 182, 198, 0.5),
          ),
        ),
        components.BackgroundImage(),
        CustomScrollView(
          slivers: <Widget>[
            _sliverAppBar(),
            _sliverFillRemaining(context, bloc)
          ],
        )
      ],
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
        expandedHeight: 200,
        floating: true,
        pinned: true,
        snap: false,
        flexibleSpace: FlexibleSpaceBar(
          title: components.TextContent(
              'Login', 20.0, TextAlign.end, Colors.white, 0.0, true),
          background: components.BackgroundBanner(),
        ));
  }

  _sliverFillRemaining(context, LoginBloc bloc) {
    return SliverFillRemaining(
        child: Center(
      child: SingleChildScrollView(
          child: Container(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          components.TextContent('Iniciar Sesión', 25.0, TextAlign.center,
              Colors.black, 5.0, true),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _textField(Icons.perm_identity, false, 'Matricula',
                'Campo Obligatorio', bloc),
          ),
          SizedBox(height: 30),
          _button(context)
        ],
      ))),
    ));
  }

  _textField(icon, type, textHint, error, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.enrollmentStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){

        return TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.black, size: 30),
            filled: true,
            fillColor: Color.fromRGBO(0, 0, 0, 0.0),
            labelText: textHint,
            counterText: snapshot.data,
            errorText: snapshot.error
          ),
          obscureText: type,
          onChanged: bloc.changeEnrollment,
        );
      },
    );
  }

  _button(context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      margin: EdgeInsets.symmetric(horizontal: 60.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        color: Colors.cyan,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {},
        child: components.TextContent(
            'Entrar', 15.0, TextAlign.center, Colors.white, 0.5, true),
      ),
    );
  }
}
