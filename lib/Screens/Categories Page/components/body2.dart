import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamesbondi/Screens/List%20Courses%20Page/list_courses_screen.dart';

import '../../../constants.dart';

class CategoriesScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        child: Container(
          height: size.height,
          //width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/top_part_courses.png',
                  width: size.width * 1,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/images/Line 1.png',
                  width: size.width * 0.7,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Courses",
                  style: TextStyle(
                      fontFamily: 'Quiglet',
                      fontWeight: FontWeight.normal,
                      fontSize: 34,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Choose a category",
                  style: TextStyle(
                      fontFamily: 'Quiglet',
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                      color: customPurple),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //IT courses
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new GestureDetector(
                      onTap: () {
                        chooseDifficulty(context, size, "IT");
                      },
                      child: Image.asset(
                        'assets/images/Courses/IT.png',
                        width: size.width / 4,
                      ),
                    ),
                  ),
                  // Cooking Courses
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new GestureDetector(
                      onTap: () {
                        chooseDifficulty(context, size, "Cooking");
                      },
                      child: Image.asset(
                        'assets/images/Courses/Cooking.png',
                        width: size.width / 4,
                      ),
                    ),
                  ),
                  // Home & Garden Courses
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new GestureDetector(
                      onTap: () {
                        chooseDifficulty(context, size, "Home&Garden");
                      },
                      child: Image.asset(
                        'assets/images/Courses/Home&Garden.png',
                        width: size.width / 4,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Decorations Courses
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new GestureDetector(
                      onTap: () {
                        chooseDifficulty(context, size, "Decorations");
                      },
                      child: Image.asset(
                        'assets/images/Courses/Decorations.png',
                        width: size.width / 4,
                      ),
                    ),
                  ),
                  // Other Courses
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new GestureDetector(
                      onTap: () {
                        chooseDifficulty(context, size, "Other");
                      },
                      child: Image.asset(
                        'assets/images/Courses/Other.png',
                        width: size.width / 4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
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
                              fontSize: 20,
                              color: customPurple),
                        ),
                      ), //////////
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
                              fontSize: 20,
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
