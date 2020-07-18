import 'package:template_example/models/students.dart';
import 'dart:math' as math;

/// Classe base do algoritmo de cálculo de BMI
abstract class StudentsBmiCalculator {
  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  /// Private methods
  void _calculateStudentsBmi(List<Student> studentList) {
    for (var student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  double _calculateBmi(double height, int weight) {
    return weight / math.pow(height, 2);
  }

  /// Hook methods
  /// Por convenção, colocar sempre o do quando for um hook method

  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  /// Abstract methods

  List<Student> getStudentsData();
}
