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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración Preguntas'),
        leading: Container(),
      ),
      body: _body(),
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
        margin: EdgeInsets.all(10.0),
        child: InkWell(
          splashColor: Colors.cyan,
          onTap: (){},
            child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: components.TextContent('Preguntas #', 10.0,
                        TextAlign.center, Colors.black, 0.0, false),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      maxRadius: 30.0,
                      child: Text("${index + 1}"),
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
                          margin:
                              EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                          child: components.TextContent(item, 15.0,
                              TextAlign.justify, Colors.black, 0.0, false),
                        )),
                    SizedBox(height: 30.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        width: 30.0,
                        height: 3.0,
                        color: Colors.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: components.TextContent(
                            'Deslice a ambos lados para mas opciones',
                            10.0,
                            TextAlign.end,
                            Colors.black,
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

  _edirForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        decoration: InputDecoration(hintText: 'Escribe lo'),
      ),
    );
  }

  _showDialog(action, alerta, color, description, index) {
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
            content: Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                initialValue: "${items.questions[index]}",
                validator: (value) {
                  if (value.isEmpty) {
                    return "La pregunta no puede quedar vacia";
                  }else{
                    edit = value;
                  }
                },
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: components.TextContent('Cancelar', 18.0,
                    TextAlign.justify, Colors.amber, 0.5, true),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              _actionButton(action, index,color)
            ],
          );
        });
  }

  _actionButton(action, index,color) {
    return FlatButton(
      child: components.TextContent(
          action, 18.0, TextAlign.justify, color, 0.5, true),
      onPressed: () {
        if (action == 'Eliminar') {
          setState(() {
            items.questions.removeAt(index);
            Navigator.of(context).pop();
          });
        }else{
          if(_formKey.currentState.validate()){
            setState(() {
             items.questions[index] = edit;
             Navigator.of(context).pop();
            });
          }
        }
      },
    );
  }
}
