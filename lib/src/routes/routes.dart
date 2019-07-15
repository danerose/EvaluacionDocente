import 'package:evaluacion_docente/src/pages/evaluation_list_page.dart';
// import 'package:evaluacion_docente/src/pages/test_page.dart';
import 'package:flutter/material.dart';
import 'package:evaluacion_docente/src/pages/loading_page.dart';
import 'package:evaluacion_docente/src/pages/home_page.dart';
import 'package:evaluacion_docente/src/pages/login_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/'          : (BuildContext context) => LoadingPage(),
    'home'       : (BuildContext context) => HomePage(),
    'login'      : (BuildContext context) => LoginPage(),
    'evaluation' : (BuildContext context) => EvaluationListPage(),
    //'questions'  : (BuildContext context) => QuestionsPage()
  };
}
