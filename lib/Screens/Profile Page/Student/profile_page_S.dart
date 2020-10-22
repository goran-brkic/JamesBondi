import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile Page/Student/components/body.dart';

class SProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SProfileScreenStateful(),
    );
  }
}

class SProfileScreenStateful extends StatefulWidget {
  @override
  _SProfileScreen createState() => _SProfileScreen();
}

class _SProfileScreen extends State<SProfileScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
