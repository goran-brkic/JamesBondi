import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class BodyStudent extends StatefulWidget {
  _BodyStudent createState() => _BodyStudent();
}

class _BodyStudent extends State<BodyStudent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView();
  }
}
