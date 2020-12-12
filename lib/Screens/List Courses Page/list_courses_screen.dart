import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Courses%20Page/components/body.dart';
import 'package:jamesbondi/Screens/List Courses Page/components/body.dart';

class ListCoursesScreen extends StatelessWidget {
  Difficulty d;
  Ctgry c;
  ListCoursesScreen(Difficulty d, Ctgry c) {
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
  Difficulty d;
  Ctgry c;
  ListCoursesScreenStateful(Difficulty d, Ctgry c) {
    this.d = d;
    this.c = c;
  }
  @override
  _ListCoursesScreen createState() => _ListCoursesScreen(d, c);
}

class _ListCoursesScreen extends State<ListCoursesScreenStateful> {
  Difficulty d;
  Ctgry c;
  _ListCoursesScreen(Difficulty d, Ctgry c) {
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
