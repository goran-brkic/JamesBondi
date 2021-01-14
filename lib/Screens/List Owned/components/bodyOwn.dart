import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/Course%20Page/CourseScreen.dart';
import 'package:jamesbondi/components/Course.dart';
import 'package:jamesbondi/components/Result.dart';
import 'package:jamesbondi/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyOwned extends StatefulWidget {
  final courses;
  BodyOwned(this.courses);
  _Body createState() => _Body();
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

class _Body extends State<BodyOwned> {
  bool lec;
  void getType() async {
    lec = await SharedPreferences.getInstance()
        .then((value) => value.getBool('lecturer'));
  }

  @override
  void initState() {
    super.initState();
    getType();
  }

  //final GlobalKey<FormState> _formKey =
  //GlobalKey<FormState>(debugLabel: '_ListCoursesKey');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  builder: (context) => CourseScreen(course['category'],
                      course['difficulty'], course['courseID'])));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  course['courseName'],
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: size.width * 0.05,
                      color: Colors.white),
                ),
                Text(
                  course['coursePrice'].toString() + ' HRK',
                  style: TextStyle(
                      fontFamily: 'RoundLight',
                      fontWeight: FontWeight.normal,
                      fontSize: size.width * 0.05,
                      color: Colors.white),
                ),
              ],
            )),
      );
    }

    return FutureBuilder(
        future: CoursesDB.ownedCourses(widget.courses),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          Widget children;
          children = Scaffold(
            body: Stack(
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
                    'Owned courses',
                    style: TextStyle(
                        fontFamily: 'Quiglet',
                        fontWeight: FontWeight.normal,
                        fontSize: size.width * 0.065,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                    top: size.height * 0.24,
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
            ),
          );
          return children;
        });
  }
}
