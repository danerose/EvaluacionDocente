import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:evaluacion_docente/src/components/index.dart' as components;

class QuestionsPage extends StatefulWidget {
  @override
  State createState() => QuestionsPageState();
}

var finalScore = 0;
var questionNumber = 0;
var items = Items();

class Items {
  var questions = [
    "¿El profedor utiliza instrumentos de evaluacion para calificar el avance obtenido en la materia?",
    "¿El profesor asigna mucha tarea a tal grado que ya quieres darte de baja de la institucion para ser dealer?",
    "¿El profesor coopera para las pizzas a tal grado de que hasta alcanza para los perros que se encuentran dentro de la instituciob?",
    "¿El profesor ya te dijo que estas reprobando por faltas pero aun asi no haces nada porque esperas a que la rosa de guadalupe apareca?",
    "¿El profesor ya te dijo 'No lo se rick' cuando le preguntaste que si con dos tareas de las diez que ha dejado ya pasas?",
    "¿El profesor ya te reprobo y ahora estas molesto sabiendo que es tu culpa y de nadie mas por haber reprobado?",
    "¿El profesor ya te dijo que dejes de jugarle al 'salvar el cuatri' porque esta vez no te va a servir de nada?"
  ];
}

class QuestionsPageState extends State<QuestionsPage> {
  final _formKey = GlobalKey<FormState>();
  var edit;
  var newQuest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración Preguntas'),
        leading: Container(),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        onPressed: () {
          _showDialog('Agregar', 'Agregar', Colors.green,
              'Estas por agregar una pregunta', items.questions.length);
        },
      ),
    );
  }

  _body() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[components.BackgroundImage(), _listView()],
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: items.questions.length,
      itemBuilder: (BuildContext context, int index) {
        String item = items.questions[index];
        return Center(child: _itemsList(index, item));
      },
    );
  }

  _itemsList(index, item) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {
            _showDialog('Editar', 'Precaución', Colors.blue,
                'Estas por EDITAR la siguiente pregunta:', index);
          },
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Eliminar",
          color: Colors.red,
          icon: Icons.delete_forever,
          onTap: () {
            _showDialog('Eliminar', 'Alerta', Colors.red,
                'Estas por ELIMNAR la siguiente pregunta:', index);
          },
        )
      ],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromRGBO(0, 0, 0, 0.5),
        margin: EdgeInsets.all(10.0),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {},
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 30.0,
                      child: components.TextContent("${index + 1}", 20.0,
                          TextAlign.center, Colors.black, 0.0, true),
                    ),
                  )
                ],
              ),
              Flexible(
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 20.0),
                          child: components.TextContent(item, 15.0,
                              TextAlign.justify, Colors.white, 0.0, false),
                        )),
                    SizedBox(height: 30.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        width: 30.0,
                        height: 3.0,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                        child: components.TextContent(
                            'Deslice a uno de los lados para mas opciones',
                            10.0,
                            TextAlign.end,
                            Colors.white,
                            0.0,
                            true),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(action, alerta, color, description, index) {
    var tipo;
    if (action == 'Eliminar') {
      tipo = Container(
        child: components.TextContent("${items.questions[index]}", 18.0,
            TextAlign.justify, Colors.black, 0.0, false),
      );
    } else {
      tipo = _form(action, index);
    }
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: components.TextContent(
                      alerta, 20.0, TextAlign.center, color, 0.0, true),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: components.TextContent(description, 15.0,
                      TextAlign.center, Colors.black, 0.0, false),
                )
              ],
            ),
            content: tipo,
            actions: <Widget>[
              FlatButton(
                child: components.TextContent('Cancelar', 18.0,
                    TextAlign.justify, Colors.amber, 0.5, true),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              _actionButton(action, index, color)
            ],
          );
        });
  }

  _form(action, index) {
    var add;
    if (action == 'Editar') {
      add = "${items.questions[index]}";
    } else {
      add = "";
    }
    return Form(
      key: _formKey,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        initialValue: add,
        validator: (value) {
          if (value.isEmpty) {
            return "La pregunta no puede quedar vacia";
          } else {
            if (action == 'Editar') {
              edit = value;
            } else {
              newQuest = value;
            }
          }
          return "chale";
        },
      ),
    );
  }

  _actionButton(action, index, color) {
    return FlatButton(
      child: components.TextContent(
          action, 18.0, TextAlign.justify, color, 0.5, true),
      onPressed: () {
        if (action == 'Eliminar') {
          setState(() {
            items.questions.removeAt(index);
            Navigator.of(context).pop();
          });
        } else if (action == 'Editar') {
          if (_formKey.currentState.validate()) {
            setState(() {
              items.questions[index] = edit;
              Navigator.of(context).pop();
            });
          }
        } else {
          if (_formKey.currentState.validate()) {
            setState(() {
              items.questions.insert(index, newQuest);
              Navigator.of(context).pop();
            });
          }
        }
      },
    );
  }
}
