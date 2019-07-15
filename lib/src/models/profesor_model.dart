// To parse this JSON data, do
//
//     final profesor = profesorFromJson(jsonString);

import 'dart:convert';

ProfesorModel profesorModelFromJson(String str) => ProfesorModel.fromJson(json.decode(str));

String profesorModelToJson(ProfesorModel data) => json.encode(data.toJson());

class ProfesorModel {
    int id;
    String enrollment;
    String firstName;
    String lastName;

    ProfesorModel({
        this.id,
        this.enrollment,
        this.firstName,
        this.lastName,
    });

    factory ProfesorModel.fromJson(Map<String, dynamic> json) => new ProfesorModel(
        id: json["id"],
        enrollment: json["enrollment"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "enrollment": enrollment,
        "first_name": firstName,
        "last_name": lastName,
    };
}
