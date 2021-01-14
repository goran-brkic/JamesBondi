import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Courses Page/components/body.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoursesScreenStateful(),
    );
  }
}

class CoursesScreenStateful extends StatefulWidget {
  @override
  _CoursesScreen createState() => _CoursesScreen();
}

class _CoursesScreen extends State<CoursesScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}