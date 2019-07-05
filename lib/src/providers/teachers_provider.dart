import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:evaluacion_docente/src/models/teacher_model.dart';

class TeachersProvider {
  final String _url = "URL-API";

  Future<dynamic> createTeacher(TeacherModel data) async {
    final url = '$_url/teacher';
    final resp = await http.post(url, body: teacherModelToJson(data));
    final decodedData = json.decode(resp.body);
    return true;
  }

  Future<List<dynamic>> getTeachers() async {
    final url = "$_url/teacher";
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<TeacherModel> teachers = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id, teacher) {
      final temp = TeacherModel.fromJson(teacher);
      teachers.add(temp);
    });
    
    return teachers;
  }
}
