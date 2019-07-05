// To parse this JSON data, do
//
//     final teacherModel = teacherModelFromJson(jsonString);

import 'dart:convert';

TeacherModel teacherModelFromJson(String str) => TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
    int id;
    String name;

    TeacherModel({
        this.id,
        this.name,
    });

    factory TeacherModel.fromJson(Map<String, dynamic> json) => new TeacherModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
