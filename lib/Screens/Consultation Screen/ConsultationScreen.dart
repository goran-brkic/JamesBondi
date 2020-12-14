import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Consultation Screen/components/bodyLecturer.dart';
import 'package:jamesbondi/Screens/Consultation Screen/components/bodyStudent.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseScreenStatful(),
    );
  }
}

class CourseScreenStatful extends StatefulWidget {
  @override
  _CourseScreen createState() => _CourseScreen();
}

class _CourseScreen extends State<CourseScreenStatful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
