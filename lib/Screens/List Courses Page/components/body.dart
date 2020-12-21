import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Course%20Page/CourseScreen.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/components/Loading.dart';
import 'package:jamesbondi/constants.dart';

class BodyCourses extends StatefulWidget {
  String d;
  String c;
  BodyCourses(String d, String c) {
    this.d = d;
    this.c = c;
  }
  _Body createState() => _Body(d, c);
}

String translateString(String cat) {
  switch (cat) {
    case "IT":
      return "IT";
    case "Home&Garden":
      return "garden";
    case "Cooking":
      return "cooking";
    case "Decorations":
      return "makeup";
    case "Other":
      return "random";
  }
  return "KRIVO";
}

class _Body extends State<BodyCourses> {
  String d;
  String c;
  _Body(String d, String c) {
    this.d = d;
    this.c = c;
  }

  @override
  Widget build(BuildContext context) {
    Padding button(Map<String, dynamic> course) {
      return Padding(
        padding: const EdgeInsets.all(15),
        child: FlatButton(
            color: customPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CourseScreen(translateString(c), d, course['courseID'])));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  course['courseName'],
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  course['coursePrice'].toString() + ' €',
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            )),
      );
    }

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: CoursesDB.getCourses(translateString(c), d),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          Widget children;
          children = Stack(
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
                  '$c',
                  style: TextStyle(
                      fontFamily: 'Quiglet',
                      fontWeight: FontWeight.normal,
                      fontSize: 34,
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: size.height * 0.24,
                child: Text(
                  'Choose a course',
                  style: TextStyle(
                      fontFamily: 'Quiglet',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: customPurple),
                ),
              ),
              Positioned(
                  top: size.height * 0.30,
                  child: Container(
                      height: 400,
                      width: 400,
                      child: snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return button((snapshot.data[index]));
                              })
                          : loadingBar()))
            ],
          );
          return children;
        });
  }
}
