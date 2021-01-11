import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Checkout/checkout_screen.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';
import 'package:jamesbondi/Screens/Profile%20Page%20View/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Profile%20Page/Lecturer/profile_page_L.dart';
import 'package:jamesbondi/Screens/Request%20Consultations/request_consulations.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class BodyFresh extends StatefulWidget {
  String id;
  String cat;
  String dif;
  BodyFresh(String cat, String dif, String id) {
    this.cat = cat;
    this.dif = dif;
    this.id = id;
  }
  @override
  _BodyU createState() => _BodyU(this.cat, this.dif, this.id);
}

class _BodyU extends State<BodyFresh> {
  String courseID;
  String courseCat;
  String courseDif;
  _BodyU(String cat, String dif, String id) {
    courseCat = cat;
    courseDif = dif;
    courseID = id;
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: CoursesDB.getCourse(courseCat, courseDif, courseID),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Widget children;
          children = SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: size.height * 0.001,
                    child: Image.asset(
                      'assets/images/top_part_courses.png',
                      width: size.width * 1,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    child: Image.asset(
                      'assets/images/Line 1.png',
                      width: size.width * 0.7,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.08,
                    child: Text(
                      snapshot.hasData
                          ? snapshot.data['courseName']
                          : "LOADING",
                      style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 34,
                          color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.165,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LViewProfileScreen(
                                snapshot.data['courseMail'])));
                      },
                      child: Text(
                        snapshot.hasData
                            ? snapshot.data['courseMail']
                            : 'LOADING',
                        style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 26,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.24,
                    child: Text(
                      snapshot.hasData
                          ? snapshot.data['coursePrice'].toString() + ' HRK'
                          : '',
                      style: TextStyle(
                          fontFamily: 'RoundLight',
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                          color: customPurple),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.3,
                    child: Container(
                      //color: Colors.grey[800],
                      width: size.width - 10,
                      height: size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.grey[150],
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        border: Border(
                          top: BorderSide(width: 1.0, color: customPurple),
                          left: BorderSide(width: 1.0, color: customPurple),
                          right: BorderSide(width: 1.0, color: customPurple),
                          bottom: BorderSide(width: 1.0, color: customPurple),
                        ),
                      ),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      child: Text(
                          snapshot.hasData ? snapshot.data['courseInfo'] : '',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.83,
                    height: 50,
                    width: 200,
                    child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: size.width * 0.07),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutScreen(snapshot.data)));
                        },
                        color: customPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          snapshot.hasData ? 'BUY' : 'LOADING',
                          style: TextStyle(
                              fontFamily: 'RoundLight',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ));
          return children;
        });
  }
}
