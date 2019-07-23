import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/models/question_model.dart';
import 'package:evaluacion_docente/src/models/profesor_model.dart';
import 'package:evaluacion_docente/src/components/index.dart' as components;

class QuestionsPage extends StatefulWidget{
  final int positionProf;
  final List<QuestionModel> questions;
  QuestionsPage(this.positionProf,this.questions);
  @override
  State createState()  => QuestionsPageState();
}


class QuestionsPageState extends State<QuestionsPage> {
  
  int finalScore = 0;
  int questionNumber = 0;
  List choices = [
    "Nunca",
    "Aveces",
    "Casi Siempre",
    "Siempre",
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.data(context);
    final ind = widget.positionProf;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _body(context,bloc,ind),
      ),
    );
  }


_body(context,DataBloc bloc, ind) {
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
          _sliverFillRemaining(context,bloc,ind)
        ],
      )
    ],
  );
}

_sliverAppBar(){
  return SliverAppBar(
    leading: Container(),
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
    title:components.TextContent('Preguntas',20.0,TextAlign.center,Colors.white,0.0,true),
    background: components.BackgroundBanner(),
  );
}

_sliverFillRemaining(context,DataBloc bloc, ind) {
  if(questionNumber < widget.questions.length){
  return SliverFillRemaining(
   child: Center(
    child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: components.TextContent('Estas evaluando a:',15.0,TextAlign.left,Colors.black,0.0,false),
              )
            ),
            Align(
              alignment: Alignment.center,
              child: components.TextContent(bloc.profesors[ind].docente,20.0,TextAlign.left,Colors.black,0.0,true),
            ),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: components.TextContent("Pregunta ${questionNumber + 1} de ${widget.questions.length}",
                  15.0,TextAlign.center,Colors.black,0.0,false),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
              child: components.TextContent(widget.questions[questionNumber].ques,
              20.0,TextAlign.justify,Colors.black,0.0,false),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _button(0,bloc,ind),
                _button(1,bloc,ind),
                _button(2,bloc,ind),
                _button(3,bloc,ind),
              ],
            )
          ],
        ),
      ),
    ),
   )
  );
 }else{
   return SliverFillRemaining(
     child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Container(
             margin: EdgeInsets.all(15.0),
             child: components.TextContent('Haz termiando esta evualuacion, continua con las que te falten.',
             20.0,TextAlign.justify,Colors.black,0.0,false),
           ),
           SizedBox(height: 60.0),
           _button(4,bloc,ind)
         ],
       )
     ),
   );
 }
}



_button(option, DataBloc bloc, ind){
  var text;
  var color;
  if(option == 4){
    text  = "Regresar";
    color = Colors.red;
  }else{
    text  = choices[option];
    color = Colors.cyan;
  }
  return Container(
    width: double.infinity,
    height: 60.0,
    margin: EdgeInsets.symmetric(horizontal:60.0),
    padding: EdgeInsets.symmetric(vertical:4.0),
    child: RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      onPressed: (){
         _nextQuestion(bloc,ind);
         
      },
      child:components.TextContent(text,15.0,TextAlign.center,Colors.white,0.5, true),
    ),
  );
}

_nextQuestion(DataBloc bloc, ind){
  setState((){
    if(questionNumber==widget.questions.length){
      bloc.profesors[ind].realizado=true;
       Navigator.pushReplacementNamed(context,'evaluation');
       Future.delayed(Duration(seconds: 1),() => questionNumber = 0);
    }else{
      questionNumber++;
    }
  });
 }
}