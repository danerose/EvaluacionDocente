// To parse this JSON data, do
//
//     final profesorModel = profesorModelFromJson(jsonString);

import 'dart:convert';

ProfesorModel profesorModelFromJson(String str) =>
    ProfesorModel.fromJson(json.decode(str));

String profesorModelToJson(ProfesorModel data) => json.encode(data.toJson());

class ProfesorModel {
  int percve;
  bool realizado;
  String pdocve;
  String aluctr;
  String matcve;
  String gpocve;
  String matnom;
  String docente;

  ProfesorModel({
    this.pdocve,
    this.aluctr,
    this.matcve,
    this.gpocve,
    this.matnom,
    this.percve,
    this.docente,
    this.realizado=false
  });

  factory ProfesorModel.fromJson(Map<String, dynamic> json) =>
      new ProfesorModel(
        pdocve: json["pdocve"],
        aluctr: json["aluctr"],
        matcve: json["matcve"],
        gpocve: json["gpocve"],
        matnom: json["matnom"],
        percve: json["percve"],
        docente: json["docente"],
      );

  Map<String, dynamic> toJson() => {
        "pdocve": pdocve,
        "aluctr": aluctr,
        "matcve": matcve,
        "gpocve": gpocve,
        "matnom": matnom,
        "percve": percve,
        "docente": docente,
      };
}
