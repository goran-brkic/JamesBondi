import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Course Page/components/body.dart';

class CourseScreen extends StatelessWidget {
  String id;
  String cat;
  String dif;
  CourseScreen(String cat, String dif, String id) {
    this.cat = cat;
    this.dif = dif;
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseScreenStatful(this.cat, this.dif, this.id),
    );
  }
}

class CourseScreenStatful extends StatefulWidget {
  String id;
  String cat;
  String dif;
  CourseScreenStatful(String cat, String dif, String id) {
    this.cat = cat;
    this.dif = dif;
    this.id = id;
  }
  @override
  _CourseScreen createState() => _CourseScreen(this.cat, this.dif, this.id);
}

class _CourseScreen extends State<CourseScreenStatful> {
  String id;
  String c;
  String dif;
  _CourseScreen(String cat, String dif, String id) {
    this.c = cat;
    this.dif = dif;
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(this.c, this.dif, this.id),
    );
  }
}
