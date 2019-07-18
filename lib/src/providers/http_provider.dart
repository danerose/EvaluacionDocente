import 'dart:convert';
// import 'dart:io';

import 'package:http/http.dart' as http;

class HttpProvider {
  final String urlBase = 'https://apimysql-upqroo2019.herokuapp.com';
  final Map<String, String> headers = {
    'auth': '8f841fe16f2920045fa988929e1692df6d8a5b6837c5df22c448e51a9ddbfc3b'
  };

  //initData pide la primera preticion
  //obtiene el periodo actual de la evaluacion
  Future<String> getPeriod() async {
    final path = '$urlBase/user/periodoActual';
    final res = await http.post(
      path,
      headers: headers,
    );
    Map<String, dynamic> decodedData = json.decode(res.body);

    return decodedData['periodo'];
  }

  ///peticion que valida el login y regresa un array de Profesores
  Future<List> loadProfesors(String enrollment, String period) async {
    final path = '$urlBase/user/login';
    Map<String, dynamic> body = {
      "Matricula": enrollment,
      "Tipo": "1",
      "Periodo": period
    };

    final res = await http.post(path, body: body, headers: headers);
    Map<String, dynamic> decodedData = json.decode(res.body);
    List<dynamic> data = new List();

    if (decodedData["error"] == null) {
      data = decodedData["usuario"];
    } else {
      data.add(false);
    }

    return data;
  }

  Future<List> loadQuestions() async {
    final path = '$urlBase/evaluacion/preguntas';
    Map<String, dynamic> body = {"Tipo": "1"};

    final res = await http.post(path, body: body, headers: headers);
    Map<String, dynamic> decodedData = json.decode(res.body);
    List<dynamic> data = new List();

    if (decodedData["error"] == null) {
      data = decodedData["preguntas"];
    } else {
      data.add(false);
    }

    return data;
  }
}
