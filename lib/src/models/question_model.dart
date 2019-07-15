// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
    int id;
    String ques;

    QuestionModel({
        this.id,
        this.ques,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => new QuestionModel(
        id: json["id"],
        ques: json["ques"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ques": ques,
    };
}
