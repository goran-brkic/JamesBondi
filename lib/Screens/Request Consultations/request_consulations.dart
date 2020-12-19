import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Request%20Consultations/components/body.dart';

class RequestConsultationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestConsultationsScreenStateful(),
    );
  }
}

class RequestConsultationsScreenStateful extends StatefulWidget {
  @override
  _RequestConsultationsScreen createState() => _RequestConsultationsScreen();
}

class _RequestConsultationsScreen
    extends State<RequestConsultationsScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
