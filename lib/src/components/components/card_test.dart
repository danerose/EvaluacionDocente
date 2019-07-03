import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/components/text_content.dart';
import 'package:evaluacion_docente/src/components/images/background_footer.dart';
import 'package:evaluacion_docente/src/pages/questions_page.dart';

class TestCardWidget extends StatelessWidget {
  final String name;
  final String subject;
  final String status;
  final String footer;
  TestCardWidget(this.name, this.subject, this.status, this.footer);

  @override
  Widget build(BuildContext context) {
    //All container del fondo
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: _cardContent(context, name, subject, status, footer),
    );
  }
}

_cardContent(context, name, subject, status, footer) {
  return Material(
    elevation: 10.0,
    color: Color.fromRGBO(0, 0, 0, 0.6),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionsPage(name)),
        ); 
      },
      //Container de cada cart
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: _contentCard(context, name, subject, status, footer),
              ),
            ),
            Expanded(
              child: Container(
                child: _footerCard(context, name, subject, status, footer),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

_contentCard(context, name, subject, status, footer) {
  return Row(
    children: <Widget>[
      Expanded(
          flex: 7,
          child: Container(
            padding: EdgeInsets.only(right: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _alignContent(Alignment.topLeft, 10.0, name, 20.0,
                            TextAlign.start, true),
                        Container(
                          margin:EdgeInsets.only(left:5.0),
                          color: Colors.white,
                          height: 1.0,
                        ),
                        _alignContent(Alignment.centerLeft, 10.0, subject, 18.0,
                            TextAlign.start, false),
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: _status(status),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 3.0,
                            width: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        _alignContent(Alignment.bottomRight, 0.0, footer, 10.0,
                            TextAlign.end, true)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      Expanded(
          child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 40.0,
          ),
        ),
      )),
    ],
  );
}

_footerCard(context, user, title, description, footer) {
  return Container(
    child: BackgroundFooter(),
  );
}

_alignContent(alignment, padding, text, sizeText, alignText, bold) {
  return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: TextContent(text, sizeText, alignText, Colors.white, bold),
      ));
}

_status(status) {
  Color color;
  String text;
  if (status == 'Hecho') {
    color = Colors.red;
    text = 'Realizado';
  } else {
    color = Colors.teal;
    text = 'Pendiente';
  }
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right:15.0),
        child: TextContent('Estado', 12.0, TextAlign.start, Colors.white, false),
      ),
      Container(
        padding: EdgeInsets.only(left: 15.0,right:15.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: TextContent(text, 12.0, TextAlign.center, Colors.white, false),
      ),
    ],
  );
}
