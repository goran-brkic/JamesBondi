import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Courses%20Page/components/body.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/constants.dart';

class BodyCourses extends StatefulWidget {
  Difficulty d;
  Ctgry c;
  BodyCourses(Difficulty d, Ctgry c) {
    this.d = d;
    this.c = c;
  }
  _Body createState() => _Body(d, c);
}

class _Body extends State<BodyCourses> {
  Difficulty d;
  Ctgry c;
  //String dString = d.toString().substring(11); //poslije ovo napravit
  //String cString = c.toString().substring(6);
  //Future<List> courses = CoursesDB.getCourses(dString, cString);
  _Body(Difficulty d, Ctgry c) {
    this.d = d;
    this.c = c;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                "Choose a course",
                style: TextStyle(
                    fontFamily: 'Quiglet',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: customPurple),
              ),
            ),
            Positioned(
                top: size.height * 0.30,
                child: ListView(
                  children: [
                    button('Vjekom', 0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

button(String name, int price) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: FlatButton(
        color: customPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          //ide na sljedecu stranicu
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$name',
              style: TextStyle(
                  fontFamily: 'RoundLight',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.white),
            ),
            Text(
              '$price €',
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
