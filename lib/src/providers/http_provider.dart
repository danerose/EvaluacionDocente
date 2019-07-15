import 'dart:convert';
// import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:evaluacion_docente/src/models/profesor_model.dart';

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
    final Map<String, dynamic> decodedData = json.decode(res.body);

    return decodedData['periodo'];
  }

  Future<List<ProfesorModel>> loginNProfesors() async {
    final path = '$urlBase/user/login';
    final data = {"Matricula": "201600090", "Tipo": "1", "Periodo": "3192"};
    print(data);
    print(json.encode(data));
    final res =
        await http.post(path, body:data, headers: headers);
    final Map<String, dynamic> decodedData = json.decode(res.body);
    final List<ProfesorModel> profesors = new List();

    print(decodedData);
    // if (decodedData == null) return [];

    // decodedData.forEach((i, profesor) {
    //   final profTemp = profesorModelFromJson(profesor);
    //   profesors.add(profTemp);
    // });

    return profesors;
  }
}
