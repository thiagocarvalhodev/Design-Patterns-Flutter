import 'dart:convert';

import 'package:template_example/api/json_students_api.dart';
import 'package:template_example/calculator/students_bmi_calculator.dart';
import 'package:template_example/models/students.dart';

class StudentsJsonBmiCalculator extends StudentsBmiCalculator {
  final api = JsonStudentsApi();

  @override
  List<Student> getStudentsData() {
    var studentsJson = api.getStudentsJson();
    var studentsMap = json.decode(studentsJson) as Map<String, dynamic>;
    var studentsJsonList = studentsMap['students'] as List;
    var studentsList = studentsJsonList.map((json) => Student(
          fullName: json['fullName'],
          age: json['age'],
          height: json['height'],
          weight: json['weight'],
        )).toList();

    return studentsList;
  }
}
