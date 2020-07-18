import 'package:flutter/material.dart';
import 'package:template_example/calculator/students_json_bmi_calculator.dart';
import 'package:template_example/calculator/students_xml_bmi_calculator.dart';
import 'package:template_example/calculator/teenage_students_json_bmi_calculator.dart';
import 'package:template_example/widgets/student_section.dart';

class TemplateMethodExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StudentsSection(
                bmiCalculator: StudentsXmlBmiCalculator(),
                headerText: 'Students from XML data source:',
              ),
              const SizedBox(height: 16),
              StudentsSection(
                bmiCalculator: StudentsJsonBmiCalculator(),
                headerText: 'Students from JSON data source:',
              ),
              const SizedBox(height: 16),
              StudentsSection(
                bmiCalculator: TeenageStudentsJsonBmiCalculator(),
                headerText: 'Students from JSON data source (teenagers only):',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
