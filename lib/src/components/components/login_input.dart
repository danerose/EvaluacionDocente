import 'package:flutter/material.dart';
//Own import

class LoginInput extends StatelessWidget {
  
  final textHint;
  final bool password;
  
  LoginInput(this.textHint,this.password);
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Poppins', fontSize: 15.0);
    return TextFormField(
      obscureText: password,
        style: style,
        //keyboardType: TextInputType.number,
        //inputFormatters: <TextInputFormatter>[
          //WhitelistingTextInputFormatter.digitsOnly
        //],
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color: Colors.cyan[300], width: 3.0)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: textHint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: (matricula) {
        if (matricula.isEmpty) {
          return 'Campo Obligatorio*';
        }
      }
    );
  }
}
