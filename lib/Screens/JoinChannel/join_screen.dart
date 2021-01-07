import 'package:flutter/material.dart';

import 'components/body.dart';

class JoinScreen extends StatelessWidget {
  final String meetID;
  final bool lecturer;

  JoinScreen(this.meetID, this.lecturer);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(meetID, lecturer),
    );
  }
}
