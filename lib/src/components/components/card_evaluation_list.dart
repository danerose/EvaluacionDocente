import 'package:evaluacion_docente/src/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;

class EvaluationCardWidget extends StatelessWidget {
  final String name;
  final String subject;
  final bool status;
  final String footer;
  EvaluationCardWidget(this.name, this.subject, this.status, this.footer);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(0,0,0,0.5),
        child: InkWell(
            splashColor: Colors.black,
             borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) => TestPage(name),
            ));
            },
            child: Container(
              child: _cardContent(context, name, subject, status, footer),
            )),
      ),
    );
  }
}

_cardContent(context, name, subject, status, footer) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
            margin: EdgeInsets.all(5.0),
            child: components.LogoUPQROO(2,100.0, 100.0),
          )),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child:Container(
                    margin: EdgeInsets.all(5.0),
                    child:components.TextContent(name,20.0,TextAlign.left,Colors.white,0.0,false),
                  )
                ),
                Container(
                  margin: EdgeInsets.all(3.0),
                  height: 3.0,
                  color: Colors.white70,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child:Container(
                    margin: EdgeInsets.all(5.0),
                    child:components.TextContent(subject,15.0,TextAlign.left,Colors.white,0.0,false),
                  )
                ),
                _status(status),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0,right:10.0,bottom: 5.0),
                    height: 5.0,
                    width: 30.0,
                    color: Colors.white,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(right:10.0,bottom: 5.0),
                    child: components.TextContent(footer,10.0,TextAlign.end,Colors.white,0.0,true),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15.0),bottomRight:Radius.circular(15.0)),
          image: DecorationImage(
          image: AssetImage('assets/images/footer_upqroo.png'),
          fit: BoxFit.cover
         )
        ),
      )
    ],
  );
}

_status(status) {
  var color;
  var text;
  if (status == true) {
    color = Colors.green;
    text = 'Realizado';
  } else {
    color = Colors.amber;
    text = 'Pendiente';
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: 5.0),
            child: components.TextContent(
                'Estado:', 15.0, TextAlign.right, Colors.white, 0.5, false),
          )),
      Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding:
                EdgeInsets.only(right: 5.0, left: 5.0, top: 2.0, bottom: 2.0),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(right: 20.0, left: 10.0),
            child: components.TextContent(
                text, 10.0, TextAlign.right, Colors.white, 0.5, false),
          )),
    ],
  );
}
