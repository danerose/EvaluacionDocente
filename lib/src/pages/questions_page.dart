import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;

class QuestionsPage extends StatefulWidget{
  @override
  State createState()  => QuestionsPageState();
}

var finalScore = 0;
var questionNumber = 0;
var itemsTest  = Items();


class Items{

  var questions = [
    "El profesor hace rubricas",
    "El profesor deja mucha tarea",
    "El profesor coopera para las pizzitas",
    "El profesoe ya te reprobó mas de una vez"
  ];

  var choices = [
    "Nunca",
    "Aveces",
    "Casi Siempre",
    "Siempre",
  ];
}

class QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: _body(context),
      ),
    );
  }


_body(context) {
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
          _sliverFillRemaining(context)
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
    title:components.TextContent('Profes',20.0,TextAlign.center,Colors.white,0.0,true),
    background: components.BackgroundBanner(),
  );
}

_sliverFillRemaining(context) {
  if(questionNumber < itemsTest.questions.length){
  return SliverFillRemaining(
   child: Center(
    child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: components.TextContent("Pregunta ${questionNumber + 1} de ${itemsTest.questions.length}",
                  15.0,TextAlign.center,Colors.black,0.0,false),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
              child: components.TextContent(itemsTest.questions[questionNumber],
              15.0,TextAlign.justify,Colors.black,0.0,false),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _button(0),
                _button(1),
                _button(2),
                _button(3),
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
           _button(4)
         ],
       )
     ),
   );
 }
}



_button(option){
  var text;
  var color;
  if(option == 4){
    text  = "Regresar";
    color = Colors.red;
  }else{
    text  = itemsTest.choices[option];
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
         _nextQuestion();
      },
      child:components.TextContent(text,15.0,TextAlign.center,Colors.white,0.5, true),
    ),
  );
}

_nextQuestion(){
  setState((){
    if(questionNumber==itemsTest.questions.length){
       Navigator.pushNamed(context,'evaluation');
       questionNumber = 0;
    }else{
      questionNumber++;
    }
  });
 }
}