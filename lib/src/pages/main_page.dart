import 'package:evaluacion_docente/src/pages/evaluation_list_page.dart';
import 'package:evaluacion_docente/src/pages/questions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Own Imports
import 'package:evaluacion_docente/src/components/index.dart' as components;

class MainPage extends StatefulWidget{
  final user;
  MainPage(this.user);
  @override
  State createState()  => MainPageState();
}


class MainPageState extends State<MainPage> {
  
  int _selectedPage = 0;
  final _pageOptions=[
    EvaluationListPage(),
    QuestionsPage(),
    Text('Tres'),
  ];
  
  @override
  Widget build(BuildContext context) {
    if (widget.user == 'Alumnos') {
      return EvaluationListPage();
    }else{
      return Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            _bottomNavigationBarItem(Icons.chrome_reader_mode,'Evaluaciones'),
            _bottomNavigationBarItem(Icons.assignment,'Preguntas'),
            _bottomNavigationBarItem(Icons.assessment, 'Reportes')
          ],
        ), 
      );
    }
  }

  _bottomNavigationBarItem(icon,text){
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(text)
    );
  }
}