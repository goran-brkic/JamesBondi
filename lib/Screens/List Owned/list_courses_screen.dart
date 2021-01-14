import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List Owned/components/body.dart';

import 'components/bodyOwn.dart';

class ListYourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListYourScreenStateful(),
    );
  }
}

class ListYourScreenStateful extends StatefulWidget {
  @override
  _ListYourScreen createState() => _ListYourScreen();
}

class _ListYourScreen extends State<ListYourScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyCourses(),
    );
  }
}

class ListOwnedScreen extends StatelessWidget {
  final courses;
  ListOwnedScreen(this.courses);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListOwnedScreenStateful(courses),
    );
  }
}

class ListOwnedScreenStateful extends StatefulWidget {
  final courses;
  ListOwnedScreenStateful(this.courses);
  @override
  _ListOwnedScreen createState() => _ListOwnedScreen();
}

class _ListOwnedScreen extends State<ListOwnedScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyOwned(widget.courses),
    );
  }
}
