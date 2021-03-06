import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';

import '../../../constants.dart';

class CategoriesScreen2 extends StatelessWidget {
  // GlobalKey<FormState> _formKey1 =
  //GlobalKey<FormState>(debugLabel: '_CategoriesScreenKey');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 1.05,
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
                    fontSize: size.width * 0.08,
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
                    fontSize: size.width * 0.062,
                    color: customPurple),
              ),
            ),

            // IT Courses
            Positioned(
              top: size.height * 0.31,
              left: size.width * 0.05,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, "IT");
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
                  chooseDifficulty(context, size, "Cooking");
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
                  chooseDifficulty(context, size, "Home&Garden");
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
                  chooseDifficulty(context, size, "Decorations");
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
              left: size.width * 0.3,
              child: new GestureDetector(
                onTap: () {
                  chooseDifficulty(context, size, "Other");
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
    );
  }
}

chooseDifficulty(context, size, category) {
  return showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose a difficulty',
                      style: TextStyle(
                        fontFamily: 'RoundLight',
                        fontWeight: FontWeight.normal,
                        fontSize: size.width * 0.05,
                        color: Colors.white,
                      ),
                    ),
                    // ljubicasti kvadrat
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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(0, size.height * 0.035, 0, 0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ListCoursesScreen("beginner", category)));
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
                              fontSize: size.width * 0.05,
                              color: customPurple),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ListCoursesScreen("intermediate", category)));
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
                            fontSize: size.width * 0.05,
                            color: customPurple),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ListCoursesScreen("advanced", category)));
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
                            fontSize: size.width * 0.05,
                            color: customPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
