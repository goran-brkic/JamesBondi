import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/AddCourse/components/body.dart';

class AddCourseScreen extends StatelessWidget {
  String category;
  String difficulty;

  AddCourseScreen(this.category, this.difficulty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddCourseScreenStateful(this.category, this.difficulty),
    );
  }
}

class AddCourseScreenStateful extends StatefulWidget {
  String category;
  String difficulty;

  AddCourseScreenStateful(this.category, this.difficulty);
  @override
  _AddCourseScreen createState() => _AddCourseScreen();
}

class _AddCourseScreen extends State<AddCourseScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.category, widget.difficulty),
    );
  }
}
