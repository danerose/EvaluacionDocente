import 'package:evaluacion_docente/src/bloc/provider_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:evaluacion_docente/src/components/index.dart' as components;


class HomeCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String footer;
  final String role;
  HomeCardWidget(this.title, this.description, this.footer, this.role);

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.data(context);
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(10.0),
        color: Color.fromRGBO(0, 0, 0, 0.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage("assets/images/shape.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: InkWell(
            onTap: () {
              bloc.changeRole(role);
              print(bloc.role);
              Navigator.pushNamed(context, 'login');
            },
            child: Container(
              child: _cardContent(context, title, description, footer),
            ),
          ),
        ),
      ),
    );
  }
}

_cardContent(context, title, description, footer) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Container(),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: _body(context, title, description, footer),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 40.0,
                )),
          )
        ],
      )
    ],
  );
}

_body(context, title, description, footer) {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.only(left: 10.0),
          child: components.TextContent(
              title, 20.0, TextAlign.left, Colors.white, 0.0, false),
        ),
      ),
      Container(
        width: double.infinity,
        height: 2.0,
        margin: EdgeInsets.all(10.0),
        color: Colors.white,
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(left: 10.0, bottom: 20.0),
          child: components.TextContent(
              description, 15.0, TextAlign.left, Colors.white, 0.0, false),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 30.0,
          height: 5.0,
          color: Colors.white,
          margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(right: 10.0, bottom: 20.0),
          child: components.TextContent(
              footer, 10.0, TextAlign.left, Colors.white, 0.0, true),
        ),
      )
    ],
  );
}
