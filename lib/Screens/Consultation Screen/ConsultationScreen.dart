import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Consultation Screen/components/bodyLecturer.dart';
import 'package:jamesbondi/Screens/Consultation Screen/components/bodyStudent.dart';

class ConsultationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConsultationScreenStateful(),
    );
  }
}

class ConsultationScreenStateful extends StatefulWidget {
  @override
  _ConsultationScreen createState() => _ConsultationScreen();
}

class _ConsultationScreen extends State<ConsultationScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyStudent(),
    );
  }
}
