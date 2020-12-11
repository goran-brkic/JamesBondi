import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';
import 'package:jamesbondi/Screens/SignIn/signin_screen.dart';
import 'package:jamesbondi/components/InputField.dart';
import 'package:jamesbondi/components/userInfo.dart';
import 'package:jamesbondi/constants.dart';

class Body extends StatefulWidget {
  _Body createState() => _Body();
}

enum Difficulty { begginer, intermediate, advanced }
enum Ctgry { IT, Cooking, HomeGarden, Decorations, Other }

class _Body extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Difficulty _difficulty = Difficulty.begginer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                "Courses",
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
                "Choose a category",
                style: TextStyle(
                    fontFamily: 'Quiglet',
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                    color: customPurple),
              ),
            ),

            // IT Courses
            Positioned(
              top: size.height * 0.31,
              left: size.width * 0.05,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, Ctgry.IT);
                },
                child: Image.asset(
                  'assets/images/Courses/IT.png',
                  width: size.width * 0.4,
                ),
              ),
            ),

            // Cooking Courses
            Positioned(
              top: size.height * 0.31,
              left: size.width * 0.55,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, Ctgry.Cooking);
                },
                child: Image.asset(
                  'assets/images/Courses/Cooking.png',
                  width: size.width * 0.4,
                ),
              ),
            ),

            // Home & Garden Courses
            Positioned(
              top: size.height * 0.56,
              left: size.width * 0.05,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, Ctgry.HomeGarden);
                },
                child: Image.asset(
                  'assets/images/Courses/Home&Garden.png',
                  width: size.width * 0.4,
                ),
              ),
            ),

            // Decorations Courses
            Positioned(
              top: size.height * 0.56,
              left: size.width * 0.55,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, Ctgry.Decorations);
                },
                child: Image.asset(
                  'assets/images/Courses/Decorations.png',
                  width: size.width * 0.4,
                ),
              ),
            ),

            // Other Courses
            Positioned(
              top: size.height * 0.81,
              left: size.width * 0.05,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, Ctgry.Other);
                },
                child: Image.asset(
                  'assets/images/Courses/Other.png',
                  width: size.width * 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  chooseDifficulty(context, size, category) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.08, size.height * 0.4, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Choose a difficulty',
                          style: TextStyle(
                            fontFamily: 'RoundLight',
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.25,
                            color: customPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        size.width * 0.14, size.height * 0.45, 0, 0),
                    child: Column(
                      children: <Widget>[
                        /////////
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListCoursesScreen(
                                    Difficulty.begginer, category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Begginer",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ), //////////
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListCoursesScreen(
                                    Difficulty.intermediate, category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Intermediate",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListCoursesScreen(
                                    Difficulty.advanced, category)));
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Advanced",
                            style: TextStyle(
                                fontFamily: 'RoundLight',
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: customPurple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
