import 'package:flutter/material.dart';
import 'package:template_example/calculator/students_bmi_calculator.dart';
import 'package:template_example/models/students.dart';
import 'package:template_example/widgets/platform_button.dart';
import 'package:template_example/widgets/student_data_table.dart';

class StudentsSection extends StatefulWidget {
  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection({
    @required this.bmiCalculator,
    @required this.headerText,
  })  : assert(bmiCalculator != null),
        assert(headerText != null);

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = List<Student>();

  void _calculateBmiAndGetStudentsData() {
    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        const SizedBox(height: 16),
        Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: students.length > 0 ? 1.0 : 0.0,
              child: StudentsDataTable(
                students: students,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: students.length == 0 ? 1.0 : 0.0,
              child: PlatformButton(
                child: Text('Calculate BMI and get students\' data'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _calculateBmiAndGetStudentsData,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
