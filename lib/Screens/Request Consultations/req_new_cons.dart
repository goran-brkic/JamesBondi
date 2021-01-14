import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/bodyNew.dart';

class RequestNewConsultationsScreen extends StatelessWidget {
  final String meetID;

  RequestNewConsultationsScreen(this.meetID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestNewConsultationsScreenStateful(meetID),
    );
  }
}

class RequestNewConsultationsScreenStateful extends StatefulWidget {
  final String meetID;
  RequestNewConsultationsScreenStateful(this.meetID);
  @override
  _RequestNewConsultationsScreen createState() =>
      _RequestNewConsultationsScreen();
}

class _RequestNewConsultationsScreen
    extends State<RequestNewConsultationsScreenStateful> {
  @override
  Widget build(BuildContext context) {
    print('MEET AJDI: ' + widget.meetID.toString());
    return Scaffold(
      body: BodyNew(widget.meetID),
    );
  }
}
