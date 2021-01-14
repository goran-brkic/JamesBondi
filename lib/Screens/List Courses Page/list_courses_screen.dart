import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List Courses Page/components/body.dart';

class ListCoursesScreen extends StatelessWidget {
  String d;
  String c;
  ListCoursesScreen(String d, String c) {
    this.d = d;
    this.c = c;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListCoursesScreenStateful(d, c),
    );
  }
}

class ListCoursesScreenStateful extends StatefulWidget {
  String d;
  String c;
  ListCoursesScreenStateful(String d, String c) {
    this.d = d;
    this.c = c;
  }
  @override
  _ListCoursesScreen createState() => _ListCoursesScreen(d, c);
}

class _ListCoursesScreen extends State<ListCoursesScreenStateful> {
  String d;
  String c;
  _ListCoursesScreen(String d, String c) {
    this.d = d;
    this.c = c;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyCourses(d, c),
    );
  }
}
