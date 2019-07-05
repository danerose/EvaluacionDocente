import 'package:flutter/material.dart';
//Own Imports
import 'package:evaluacion_docente/src/components/index.dart';

class LoginSubmit extends StatelessWidget {
  final formkey;
  LoginSubmit(this.formkey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.0,
      height: 50.0,
      child: RaisedButton(
          onPressed: () {
            if (formkey.currentState.validate()) {
              Navigator.pushNamed(context, 'evaluation');
            }
          },
          color: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: TextContent(
              'Entrar', 20.0, TextAlign.center, Colors.white, false)),
    );
  }
}
