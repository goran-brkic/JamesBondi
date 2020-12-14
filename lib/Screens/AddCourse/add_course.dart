import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/AddCourse/components/body.dart';

class AddCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddCourseScreenStateful(),
    );
  }
}

class AddCourseScreenStateful extends StatefulWidget {
  @override
  _AddCourseScreen createState() => _AddCourseScreen();
}

class _AddCourseScreen extends State<AddCourseScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
