import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Consultation%20Screen/components/body.dart';
import 'package:jamesbondi/Screens/Course%20Page/components/bodyB.dart';
import 'package:jamesbondi/Screens/Course%20Page/components/bodyU.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/bodyL.dart';

class CourseScreen extends StatelessWidget {
  final String id;
  final String cat;
  final String dif;
  CourseScreen(this.cat, this.dif, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: SharedPreferences.getInstance()
          .then((value) => value.getBool('lecturer')),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else {
            if (!snapshot.hasData)
              return Center(child: Text('No Data'));
            else {
              return snapshot.data
                  ? BodyLec(cat, dif, id)
                  : CourseScreenStatful(cat, dif, id);
            }
          }
        }
      },
    ));
  }
}

class CourseScreenStatful extends StatefulWidget {
  String id;
  String cat;
  String dif;
  CourseScreenStatful(String cat, String dif, String id) {
    this.cat = cat;
    this.dif = dif;
    this.id = id;
  }
  @override
  _CourseScreen createState() => _CourseScreen(this.cat, this.dif, this.id);
}

class _CourseScreen extends State<CourseScreenStatful> {
  String id;
  String c;
  String dif;
  _CourseScreen(String cat, String dif, String id) {
    c = cat;
    this.dif = dif;
    this.id = id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserInfoDB.searchCourse(
            FirebaseAuth.instance.currentUser.email, id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              if (!snapshot.hasData)
                return Center(child: Text('No Data'));
              else {
                return snapshot.data
                    ? BodyBought(c, dif, id)
                    : BodyFresh(c, dif, id);
              }
            }
          }
        },
      ),
    );
  }
}
