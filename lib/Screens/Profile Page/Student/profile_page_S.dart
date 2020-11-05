import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Profile Page/Student/components/body.dart';

class SProfileScreen extends StatelessWidget {
  final User loggedUser;

  SProfileScreen(this.loggedUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SProfileScreenStateful(loggedUser),
    );
  }
}

class SProfileScreenStateful extends StatefulWidget {
  final User loggedUser;

  SProfileScreenStateful(this.loggedUser);
  @override
  _SProfileScreen createState() => _SProfileScreen();
}

class _SProfileScreen extends State<SProfileScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(widget.loggedUser),
    );
  }
}
