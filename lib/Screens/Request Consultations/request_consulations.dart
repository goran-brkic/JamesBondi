import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Request%20Consultations/components/body.dart';

class RequestConsultationsScreen extends StatelessWidget {
  String cat;
  String dif;
  String courseID;
  RequestConsultationsScreen(this.cat, this.dif, this.courseID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestConsultationsScreenStateful(cat, dif, courseID),
    );
  }
}

class RequestConsultationsScreenStateful extends StatefulWidget {
  String cat;
  String dif;
  String courseID;
  RequestConsultationsScreenStateful(this.cat, this.dif, this.courseID);
  @override
  _RequestConsultationsScreen createState() => _RequestConsultationsScreen();
}

class _RequestConsultationsScreen
    extends State<RequestConsultationsScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.cat, widget.dif, widget.courseID),
    );
  }
}
