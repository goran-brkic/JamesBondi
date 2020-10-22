import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile Page/Lecturer/components/body.dart';

class LProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LProfileScreenStateful(),
    );
  }
}

class LProfileScreenStateful extends StatefulWidget {
  @override
  _LProfileScreen createState() => _LProfileScreen();
}

class _LProfileScreen extends State<LProfileScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
