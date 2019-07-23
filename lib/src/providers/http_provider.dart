import 'dart:convert';
import 'dart:io';
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
     Map<String, dynamic> decodedData;
    try{
      final res = await http.post(
        path,
        headers: headers,
      );
      decodedData = json.decode(res.body);
    }on SocketException catch (_) {
      print('not connected');
    }

    return decodedData['periodo'];
  }

  ///peticion que valida el login y regresa un array de Profesores
  Future<Map> login(String enrollment, String pass, String role) async {
    final path = '$urlBase/user/login';
    Map<String, dynamic> decodedData;
    Map<String,dynamic> data = new Map();
    Map<String, dynamic> body = {
      "Matricula": enrollment,
      "Tipo": role,
      "Password": pass
    };

    try {
      final res = await http.post(path, body: body, headers: headers);
      print(res);
      decodedData = json.decode(res.body);

      if (decodedData["error"] == null) {
        data = decodedData["usuario"];
      } else {
        data = {"error":true};
      }
    }on SocketException catch (_) {
      print('not connected');
      data = {"error":true};
    } 

    return data;
  }

  Future<dynamic> loadProfesors(String enrollment, String period) async{
    final path = '$urlBase/evaluacion/materias';
    Map<String, dynamic> decodedData;
    List<dynamic> data = new List();
    Map<String, dynamic> body = {
      "Matricula": enrollment,
      "Periodo": period
    };

    try {
      final res = await http.post(path, body: body, headers: headers);
      decodedData = json.decode(res.body);

      if (decodedData["error"] == null) {
        data = decodedData["materias"];
      } else {
        data.add(false);
      }
    }on SocketException catch (_) {
      print('not connected');
      data.add(false);
    } catch (_){
      data.add(false);
    }

    return data;
  }

  Future<List> loadQuestions(String evalType) async {
    final path = '$urlBase/evaluacion/preguntas';
    Map<String, dynamic> body = {"Tipo": evalType};
    Map<String, dynamic> decodedData;
    List<dynamic> data = new List();

    try{
      final res = await http.post(path, body: body, headers: headers);
      decodedData = json.decode(res.body);
      if (decodedData["error"] == null) {
        data = decodedData["preguntas"];
      } else {
        data.add(false);
      }
    }on SocketException catch (_) {
      print('not connected');
      data.add(false);
    }

    return data;
  }

  Future<bool> validateConexion() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
