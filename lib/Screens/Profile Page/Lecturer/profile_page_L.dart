import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile Page/Lecturer/components/body.dart';

class LProfileScreen extends StatelessWidget {
  final String loggedUser;

  LProfileScreen(this.loggedUser);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LProfileScreenStateful(loggedUser),
    );
  }
}

class LProfileScreenStateful extends StatefulWidget {
  final String loggedUser;

  LProfileScreenStateful(this.loggedUser);
  @override
  _LProfileScreen createState() => _LProfileScreen();
}

class _LProfileScreen extends State<LProfileScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.loggedUser),
    );
  }
}
