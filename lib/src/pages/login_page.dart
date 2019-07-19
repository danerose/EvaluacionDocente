import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;
import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(context) {
    final bloc = ProviderBloc.data(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: bloc.role,
          child: Container(
            color: Color.fromRGBO(33, 182, 198, 0.5),
          ),
        ),
        components.BackgroundImage(),
        CustomScrollView(
          slivers: <Widget>[
            _sliverAppBar(bloc),
            _sliverFillRemaining(context, bloc)
          ],
        )
      ],
    );
  }

  _sliverAppBar(bloc) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        title: components.TextContent('Login '+bloc.role, 20.0, TextAlign.end, Colors.white, 0.0, true),
        background: components.BackgroundBanner(),
      )
    );
  }

  _sliverFillRemaining(context, DataBloc bloc) {
    if(bloc.role == 'alumno'){
    return SliverFillRemaining(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                components.TextContent('Iniciar Sesión', 25.0, TextAlign.center,Colors.black, 5.0, true),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _textFieldEnroll(Icons.perm_identity, false, 'Matricula', bloc)
                ),
                SizedBox(height: 30),
                _button(context, bloc)
              ],
             )
          )
        ),
      )
    );
    }else{
      return SliverFillRemaining(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                components.TextContent('Iniciar Sesión', 25.0, TextAlign.center,Colors.black, 5.0, true),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _textFieldEnroll(Icons.perm_identity, false, 'Matricula', bloc)
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _textFieldPass(Icons.https, true, 'Contraseña', bloc)
                ),
                SizedBox(height: 30),
                _button(context, bloc)
              ],
             )
          )
        ),
      )
    );
    }
  }


  _textFieldEnroll(icon, type, textHint, DataBloc bloc) {
    return StreamBuilder(
      stream: bloc.enrollmentStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType:
              TextInputType.numberWithOptions(decimal: false, signed: false),
          decoration: InputDecoration(
              icon: Icon(icon, color: Colors.black, size: 30),
              filled: true,
              fillColor: Color.fromRGBO(0, 0, 0, 0.0),
              labelText: textHint,
              errorText: snapshot.error),
          obscureText: type,
          onChanged: bloc.changeEnrollment,
          maxLength: 9,
        );
      },
    );
  }

  _textFieldPass(icon, type, textHint, DataBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          keyboardType:
              TextInputType.numberWithOptions(decimal: false, signed: false),
          decoration: InputDecoration(
              icon: Icon(icon, color: Colors.black, size: 30),
              filled: true,
              fillColor: Color.fromRGBO(0, 0, 0, 0.0),
              labelText: textHint,
              errorText: snapshot.error),
          obscureText: type,
          onChanged: bloc.changePassword,
          maxLength: 9,
        );
      },
    );
  }

  _button(context, DataBloc bloc) {
    return StreamBuilder(
        stream: bloc.loadStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!bloc.isLoad) {
            return Container(
                width: double.infinity,
                height: 80.0,
                margin: EdgeInsets.symmetric(horizontal: 60.0),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                  color: Colors.cyan,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    bloc.loadProfesors().then((value) {
                      if (value) {
                        Navigator.pushNamedAndRemoveUntil(context, 'evaluation',
                            (Route<dynamic> route) => false);
                      } else {
                        this._alert(context);
                      }
                    });
                  },
                  child: components.TextContent('Entrar', 15.0,
                      TextAlign.center, Colors.white, 0.5, true),
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.cyan,
                strokeWidth: 5.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            );
          }
        });
  }

  _alert(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Datos incorrectos'),
            content: Text('Por favor ingresa tus datos correctos'),
          );
        });
  }
}
