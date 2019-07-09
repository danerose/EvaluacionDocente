
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;
import 'package:evaluacion_docente/src/pages/main_page.dart';

class LoginPage extends StatefulWidget{
  final user;
  LoginPage(this.user);
  @override
  State createState()  => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context,formKey,widget.user),
    );
  }


_body(context,formkey,user) {
  return Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Hero(
        tag:user,
        child: Container(
          color: Color.fromRGBO(33, 182, 198, 0.5),
        ),
      ),
      components.BackgroundImage(),
      CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(user), 
          _sliverFillRemaining(context,formkey,user)
        ],
      )
    ],
  );
}

_sliverAppBar(user) {
  return SliverAppBar(
    expandedHeight: 200,
    floating: true,
    pinned: true,
    snap: false,
    flexibleSpace: FlexibleSpaceBar(
      title: components.TextContent('Login  '+user,20.0, TextAlign.end, Colors.white,0.0,true),
      background: components.BackgroundBanner(),
    )
  );
}

_sliverFillRemaining(context,formkey,user) {
  return SliverFillRemaining(
   child: Center(
    child: SingleChildScrollView(
      child: Container(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              components.TextContent('Iniciar Sesión',25.0,TextAlign.center,Colors.black,5.0,true),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:_textFormField(Icons.perm_identity,false,'Matricula','Campo Obligatorio',formkey),
              ),
              SizedBox(height: 30),
              _button(context,formkey,user)  
            ],
          ),
        )
      )
    ),
   )
  );
}

_textFormField(icon,type,textHint,error,formkey){
return TextFormField(
  decoration: InputDecoration(
    icon: Icon(icon,color: Colors.black,size: 30),
    filled: true,
    fillColor: Color.fromRGBO(0,0,0,0.0),
    labelText: textHint
  ),
  obscureText: type,
  validator: (value){
    if(value.isEmpty){
      return error;
    }
  },
 );
}

_button(context,formkey,user){
  return Container(
    width: double.infinity,
    height: 80.0,
    margin: EdgeInsets.symmetric(horizontal: 60.0),
    padding: EdgeInsets.symmetric(vertical: 15.0),
    child: RaisedButton(
      color: Colors.cyan,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      onPressed: (){
        if(formkey.currentState.validate()){
          Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => MainPage(user),
          ));
        }
      },
      child:components.TextContent('Entrar',15.0,TextAlign.center,Colors.white,0.5, true),
    ),
  );
 }


}