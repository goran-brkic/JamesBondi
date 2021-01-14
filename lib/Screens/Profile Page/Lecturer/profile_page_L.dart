import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile Page/Lecturer/components/body.dart';

class LProfileScreen extends StatelessWidget {
  LProfileScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LProfileScreenStateful(),
    );
  }
}

class LProfileScreenStateful extends StatefulWidget {
  LProfileScreenStateful();
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
